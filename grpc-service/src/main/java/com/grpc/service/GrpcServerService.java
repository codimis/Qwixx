package com.grpc.service;


import com.grpc.*;
import com.grpc.Dice;
import com.grpc.Empty;
import com.grpc.QwixxServiceGrpc;
import com.grpc.Response;
import com.grpc.Room;
import com.grpc.Time;
import com.grpc.User;
import com.grpc.UserList;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Stream;

@GrpcService
public class GrpcServerService extends QwixxServiceGrpc.QwixxServiceImplBase {
     static Map<Room,ArrayList<User>> user=new HashMap<>();
     static Map<Room,Integer> queue=new HashMap<>();
     static Map<Room,Time> timer=new HashMap<>();
     static List<StreamObserver<UserList>> observers=new ArrayList<>();

    @Override
    public void getAllUsers(Room request, StreamObserver<UserList> responseObserver) {

        observers.add(responseObserver);
        UserList list=UserList.newBuilder().addAllUsers(user.get(request)).build();

        for(StreamObserver<UserList> observer:observers){
            observer.onNext(list);
        }
        try {
            Thread.sleep(100000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        responseObserver.onCompleted();
        observers.remove(responseObserver);
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
    public void join(User request, StreamObserver<User> responseObserver) {
        Room room=Room.newBuilder().setRoomId(request.getRoom().getRoomId()).build();
        if(user.keySet().stream().anyMatch(room1 -> request.getRoom().getRoomId().equals(room1.getRoomId()))){

            user.get(room).add(request.toBuilder().setQueue(user.get(room).size()).build());
            responseObserver.onNext(request);
        }else{

            responseObserver.onError(new Throwable());
        }
        responseObserver.onCompleted();
    }

    @Override
    public void setTime(Time request, StreamObserver<Empty> responseObserver) {
        timer.put(request.getRoom(),request);
        responseObserver.onNext(Empty.newBuilder().build());
        responseObserver.onCompleted();
    }

    @Override
    public void startTimer(Room request, StreamObserver<Time> responseObserver) {
        LocalDateTime deadline= LocalDateTime.now().plusSeconds(timer.get(request).getTime());
        int timeCount=timer.get(request).getTime();
        Room room=request;
        while (LocalDateTime.now().isBefore(deadline)) {
            responseObserver.onNext(Time.newBuilder().setTime(timeCount).setRoom(room).build());
            try {
                Thread.sleep(1000);
                timeCount--;
                timer.replace(request,Time.newBuilder().setTime(timeCount).setRoom(request).build());
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        responseObserver.onCompleted();
    }

    @Override
    public void create(User request, StreamObserver<User> responseObserver) {
        Room room=Room.newBuilder().setRoomId(request.getRoom().getRoomId()).setSixSide(request.getRoom().getSixSide()).build();
        if(user.containsKey(room)){
            responseObserver.onError(new Throwable("Room already exist"));

        }else{

            user.put(room,new ArrayList<>());
            user.get(room).add(request);
            responseObserver.onNext(request);
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
