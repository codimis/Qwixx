package com.grpc.service;


import com.grpc.*;
import com.grpc.Empty;
import com.grpc.QwixxServiceGrpc;
import com.grpc.Response;
import com.grpc.Room;
import com.grpc.User;
import com.grpc.UserList;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

import java.util.*;
import java.util.stream.Stream;

@GrpcService
public class GrpcServerService extends QwixxServiceGrpc.QwixxServiceImplBase {
     static Map<Room,ArrayList<User>> user=new HashMap<>();
     static Map<Room,Integer> queue=new HashMap<>();
    @Override
    public void getAllUsers(Room request, StreamObserver<UserList> responseObserver) {

        List<User> userListed= user.get(request);
        responseObserver.onNext(UserList.newBuilder().addAllUsers(userListed).build());
        responseObserver.onCompleted();
    }

    @Override
    public void currentUser(Room request, StreamObserver<User> responseObserver) {
        int userQueue=queue.get(request);
        responseObserver.onNext(user.get(request).get(userQueue));
        responseObserver.onCompleted();
    }

    @Override
    public void nextUser(User request, StreamObserver<User> responseObserver) {
        queue.replace(request.getRoom(),queue.get(request.getRoom())+1);
        int userQueue=queue.get(request.getRoom());
        responseObserver.onNext(user.get(request.getRoom()).get(userQueue));
        responseObserver.onCompleted();
    }

    @Override
    public void join(User request, StreamObserver<Response> responseObserver) {
        Room room=Room.newBuilder().setRoomId(request.getRoom().getRoomId()).build();
        if(user.containsKey(room)){

            user.get(room).add(request);
            responseObserver.onNext(Response.newBuilder().setMsg("Success").setError(0).build());
        }else{
            responseObserver.onNext(Response.newBuilder().setMsg("Room does not exist").setError(1).build());
        }
        responseObserver.onCompleted();
    }

    @Override
    public void create(User request, StreamObserver<Response> responseObserver) {
        Room room=Room.newBuilder().setRoomId(request.getRoom().getRoomId()).build();

        if(user.containsKey(room)){
            responseObserver.onNext(Response.newBuilder().setMsg("Room already Exist").setError(1).build());

        }else{
            user.put(room,new ArrayList<>());
            user.get(room).add(request);
            responseObserver.onNext(Response.newBuilder().setMsg("Created Success").setError(1).build());
            queue.put(request.getRoom(),0);
        }
        responseObserver.onCompleted();
    }



    @Override
    public void rollDice(User request, StreamObserver<Empty> responseObserver) {
        user.get(request.getRoom()).remove(request.getQueue());
        user.get(request.getRoom()).add(request);
        responseObserver.onCompleted();

    }

    @Override
    public void receiveRollDice(Room request, StreamObserver<User> responseObserver) {
        user.get(request).forEach(responseObserver::onNext);
        responseObserver.onCompleted();
    }
}
