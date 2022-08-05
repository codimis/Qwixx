package com.grpc.service;


import com.google.protobuf.Descriptors;
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
    static Map<Room,Boolean> games=new HashMap<>();
     static List<StreamObserver<UserList>> observers=new ArrayList<>();
    static List<StreamObserver<User>> currentUserObserver=new ArrayList<>();
    static List<StreamObserver<Room>> startGameObserver=new ArrayList<>();

    @Override
    public void getStartedGame(Room request, StreamObserver<Room> responseObserver) {
        startGameObserver.add(responseObserver);
        System.out.println("Here");
        Room room=games.get(request)?request:Room.newBuilder().setRoomId("1").build();
        responseObserver.onNext(room);

       // responseObserver.onCompleted();
      //  observers.remove(responseObserver);

    }

    @Override
    public void getAllUsers(Room request, StreamObserver<UserList> responseObserver) {

        observers.add(responseObserver);
        UserList list=UserList.newBuilder().addAllUsers(user.get(request)).build();

        for(StreamObserver<UserList> observer:observers){
            observer.onNext(list);
        }


       // responseObserver.onCompleted();
       // observers.remove(responseObserver);
    }

    @Override
    public void startGame(Room request, StreamObserver<Empty> responseObserver) {
        games.replace(request,true);
        responseObserver.onNext(Empty.newBuilder().build());
        responseObserver.onCompleted();

    }

    @Override
    public void currentUser(Room request, StreamObserver<User> responseObserver) {

        currentUserObserver.add(responseObserver);
        for(StreamObserver<User> observer:currentUserObserver){
            int userQueue=queue.get(request);
            observer.onNext(user.get(request).get(userQueue));
        }
        try {
            Thread.sleep(100000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        responseObserver.onCompleted();
        currentUserObserver.remove(responseObserver);


    }

    @Override
    public void nextUser(Room request, StreamObserver<User> responseObserver) {
        int list=(queue.get(request)+1)%user.get(request).size();
        queue.replace(request,list);
        int userQueue=queue.get(request);
        responseObserver.onNext(user.get(request).get(userQueue));
        responseObserver.onCompleted();
    }

    @Override
    public void join(User request, StreamObserver<User> responseObserver) {
        Room room=Room.newBuilder().setRoomId(request.getRoom().getRoomId()).build();
        if(user.keySet().stream().anyMatch(room1 -> request.getRoom().getRoomId().equals(room1.getRoomId()))){
            user.get(room).add(request.toBuilder().setQueue(user.get(room).size()).setId(UUID.randomUUID().toString()).build());
            responseObserver.onNext(user.get(request.getRoom()).get(user.get(room).size()-1));
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
            games.put(room,false);
            user.put(room,new ArrayList<>());
            user.get(room).add(request.toBuilder().setQueue(user.get(room).size()).setId(UUID.randomUUID().toString()).build());
            responseObserver.onNext(user.get(request.getRoom()).get(user.get(room).size()-1));
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
