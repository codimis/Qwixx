package com.grpc;

import static io.grpc.stub.ClientCalls.asyncUnaryCall;
import static io.grpc.stub.ClientCalls.asyncServerStreamingCall;
import static io.grpc.stub.ClientCalls.asyncClientStreamingCall;
import static io.grpc.stub.ClientCalls.asyncBidiStreamingCall;
import static io.grpc.stub.ClientCalls.blockingUnaryCall;
import static io.grpc.stub.ClientCalls.blockingServerStreamingCall;
import static io.grpc.stub.ClientCalls.futureUnaryCall;
import static io.grpc.MethodDescriptor.generateFullMethodName;
import static io.grpc.stub.ServerCalls.asyncUnaryCall;
import static io.grpc.stub.ServerCalls.asyncServerStreamingCall;
import static io.grpc.stub.ServerCalls.asyncClientStreamingCall;
import static io.grpc.stub.ServerCalls.asyncBidiStreamingCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall;
import static io.grpc.stub.ServerCalls.asyncUnimplementedStreamingCall;

/**
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.4.0)",
    comments = "Source: schema.proto")
public final class QwixxServiceGrpc {

  private QwixxServiceGrpc() {}

  public static final String SERVICE_NAME = "com.grpc.QwixxService";

  // Static method descriptors that strictly reflect the proto.
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.User,
      com.grpc.Response> METHOD_JOIN =
      io.grpc.MethodDescriptor.<com.grpc.User, com.grpc.Response>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "join"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Response.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.User,
      com.grpc.Response> METHOD_CREATE =
      io.grpc.MethodDescriptor.<com.grpc.User, com.grpc.Response>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "create"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Response.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.Room,
      com.grpc.UserList> METHOD_GET_ALL_USERS =
      io.grpc.MethodDescriptor.<com.grpc.Room, com.grpc.UserList>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.SERVER_STREAMING)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "getAllUsers"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Room.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.UserList.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.User,
      com.grpc.User> METHOD_NEXT_USER =
      io.grpc.MethodDescriptor.<com.grpc.User, com.grpc.User>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "nextUser"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.Room,
      com.grpc.User> METHOD_CURRENT_USER =
      io.grpc.MethodDescriptor.<com.grpc.Room, com.grpc.User>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "currentUser"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Room.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.User,
      com.grpc.Empty> METHOD_ROLL_DICE =
      io.grpc.MethodDescriptor.<com.grpc.User, com.grpc.Empty>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "rollDice"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Empty.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.Room,
      com.grpc.User> METHOD_RECEIVE_ROLL_DICE =
      io.grpc.MethodDescriptor.<com.grpc.Room, com.grpc.User>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.SERVER_STREAMING)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "receiveRollDice"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Room.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.User.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.Time,
      com.grpc.Empty> METHOD_SET_TIME =
      io.grpc.MethodDescriptor.<com.grpc.Time, com.grpc.Empty>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "setTime"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Time.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Empty.getDefaultInstance()))
          .build();
  @io.grpc.ExperimentalApi("https://github.com/grpc/grpc-java/issues/1901")
  public static final io.grpc.MethodDescriptor<com.grpc.Room,
      com.grpc.Time> METHOD_START_TIMER =
      io.grpc.MethodDescriptor.<com.grpc.Room, com.grpc.Time>newBuilder()
          .setType(io.grpc.MethodDescriptor.MethodType.SERVER_STREAMING)
          .setFullMethodName(generateFullMethodName(
              "com.grpc.QwixxService", "startTimer"))
          .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Room.getDefaultInstance()))
          .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
              com.grpc.Time.getDefaultInstance()))
          .build();

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static QwixxServiceStub newStub(io.grpc.Channel channel) {
    return new QwixxServiceStub(channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static QwixxServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    return new QwixxServiceBlockingStub(channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static QwixxServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    return new QwixxServiceFutureStub(channel);
  }

  /**
   */
  public static abstract class QwixxServiceImplBase implements io.grpc.BindableService {

    /**
     */
    public void join(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.Response> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_JOIN, responseObserver);
    }

    /**
     */
    public void create(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.Response> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_CREATE, responseObserver);
    }

    /**
     */
    public void getAllUsers(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.UserList> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_GET_ALL_USERS, responseObserver);
    }

    /**
     */
    public void nextUser(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.User> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_NEXT_USER, responseObserver);
    }

    /**
     */
    public void currentUser(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.User> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_CURRENT_USER, responseObserver);
    }

    /**
     */
    public void rollDice(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.Empty> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_ROLL_DICE, responseObserver);
    }

    /**
     */
    public void receiveRollDice(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.User> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_RECEIVE_ROLL_DICE, responseObserver);
    }

    /**
     */
    public void setTime(com.grpc.Time request,
        io.grpc.stub.StreamObserver<com.grpc.Empty> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_SET_TIME, responseObserver);
    }

    /**
     */
    public void startTimer(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.Time> responseObserver) {
      asyncUnimplementedUnaryCall(METHOD_START_TIMER, responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            METHOD_JOIN,
            asyncUnaryCall(
              new MethodHandlers<
                com.grpc.User,
                com.grpc.Response>(
                  this, METHODID_JOIN)))
          .addMethod(
            METHOD_CREATE,
            asyncUnaryCall(
              new MethodHandlers<
                com.grpc.User,
                com.grpc.Response>(
                  this, METHODID_CREATE)))
          .addMethod(
            METHOD_GET_ALL_USERS,
            asyncServerStreamingCall(
              new MethodHandlers<
                com.grpc.Room,
                com.grpc.UserList>(
                  this, METHODID_GET_ALL_USERS)))
          .addMethod(
            METHOD_NEXT_USER,
            asyncUnaryCall(
              new MethodHandlers<
                com.grpc.User,
                com.grpc.User>(
                  this, METHODID_NEXT_USER)))
          .addMethod(
            METHOD_CURRENT_USER,
            asyncUnaryCall(
              new MethodHandlers<
                com.grpc.Room,
                com.grpc.User>(
                  this, METHODID_CURRENT_USER)))
          .addMethod(
            METHOD_ROLL_DICE,
            asyncUnaryCall(
              new MethodHandlers<
                com.grpc.User,
                com.grpc.Empty>(
                  this, METHODID_ROLL_DICE)))
          .addMethod(
            METHOD_RECEIVE_ROLL_DICE,
            asyncServerStreamingCall(
              new MethodHandlers<
                com.grpc.Room,
                com.grpc.User>(
                  this, METHODID_RECEIVE_ROLL_DICE)))
          .addMethod(
            METHOD_SET_TIME,
            asyncUnaryCall(
              new MethodHandlers<
                com.grpc.Time,
                com.grpc.Empty>(
                  this, METHODID_SET_TIME)))
          .addMethod(
            METHOD_START_TIMER,
            asyncServerStreamingCall(
              new MethodHandlers<
                com.grpc.Room,
                com.grpc.Time>(
                  this, METHODID_START_TIMER)))
          .build();
    }
  }

  /**
   */
  public static final class QwixxServiceStub extends io.grpc.stub.AbstractStub<QwixxServiceStub> {
    private QwixxServiceStub(io.grpc.Channel channel) {
      super(channel);
    }

    private QwixxServiceStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected QwixxServiceStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new QwixxServiceStub(channel, callOptions);
    }

    /**
     */
    public void join(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.Response> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_JOIN, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void create(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.Response> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_CREATE, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void getAllUsers(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.UserList> responseObserver) {
      asyncServerStreamingCall(
          getChannel().newCall(METHOD_GET_ALL_USERS, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void nextUser(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.User> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_NEXT_USER, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void currentUser(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.User> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_CURRENT_USER, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void rollDice(com.grpc.User request,
        io.grpc.stub.StreamObserver<com.grpc.Empty> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_ROLL_DICE, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void receiveRollDice(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.User> responseObserver) {
      asyncServerStreamingCall(
          getChannel().newCall(METHOD_RECEIVE_ROLL_DICE, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void setTime(com.grpc.Time request,
        io.grpc.stub.StreamObserver<com.grpc.Empty> responseObserver) {
      asyncUnaryCall(
          getChannel().newCall(METHOD_SET_TIME, getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void startTimer(com.grpc.Room request,
        io.grpc.stub.StreamObserver<com.grpc.Time> responseObserver) {
      asyncServerStreamingCall(
          getChannel().newCall(METHOD_START_TIMER, getCallOptions()), request, responseObserver);
    }
  }

  /**
   */
  public static final class QwixxServiceBlockingStub extends io.grpc.stub.AbstractStub<QwixxServiceBlockingStub> {
    private QwixxServiceBlockingStub(io.grpc.Channel channel) {
      super(channel);
    }

    private QwixxServiceBlockingStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected QwixxServiceBlockingStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new QwixxServiceBlockingStub(channel, callOptions);
    }

    /**
     */
    public com.grpc.Response join(com.grpc.User request) {
      return blockingUnaryCall(
          getChannel(), METHOD_JOIN, getCallOptions(), request);
    }

    /**
     */
    public com.grpc.Response create(com.grpc.User request) {
      return blockingUnaryCall(
          getChannel(), METHOD_CREATE, getCallOptions(), request);
    }

    /**
     */
    public java.util.Iterator<com.grpc.UserList> getAllUsers(
        com.grpc.Room request) {
      return blockingServerStreamingCall(
          getChannel(), METHOD_GET_ALL_USERS, getCallOptions(), request);
    }

    /**
     */
    public com.grpc.User nextUser(com.grpc.User request) {
      return blockingUnaryCall(
          getChannel(), METHOD_NEXT_USER, getCallOptions(), request);
    }

    /**
     */
    public com.grpc.User currentUser(com.grpc.Room request) {
      return blockingUnaryCall(
          getChannel(), METHOD_CURRENT_USER, getCallOptions(), request);
    }

    /**
     */
    public com.grpc.Empty rollDice(com.grpc.User request) {
      return blockingUnaryCall(
          getChannel(), METHOD_ROLL_DICE, getCallOptions(), request);
    }

    /**
     */
    public java.util.Iterator<com.grpc.User> receiveRollDice(
        com.grpc.Room request) {
      return blockingServerStreamingCall(
          getChannel(), METHOD_RECEIVE_ROLL_DICE, getCallOptions(), request);
    }

    /**
     */
    public com.grpc.Empty setTime(com.grpc.Time request) {
      return blockingUnaryCall(
          getChannel(), METHOD_SET_TIME, getCallOptions(), request);
    }

    /**
     */
    public java.util.Iterator<com.grpc.Time> startTimer(
        com.grpc.Room request) {
      return blockingServerStreamingCall(
          getChannel(), METHOD_START_TIMER, getCallOptions(), request);
    }
  }

  /**
   */
  public static final class QwixxServiceFutureStub extends io.grpc.stub.AbstractStub<QwixxServiceFutureStub> {
    private QwixxServiceFutureStub(io.grpc.Channel channel) {
      super(channel);
    }

    private QwixxServiceFutureStub(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected QwixxServiceFutureStub build(io.grpc.Channel channel,
        io.grpc.CallOptions callOptions) {
      return new QwixxServiceFutureStub(channel, callOptions);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.grpc.Response> join(
        com.grpc.User request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_JOIN, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.grpc.Response> create(
        com.grpc.User request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_CREATE, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.grpc.User> nextUser(
        com.grpc.User request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_NEXT_USER, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.grpc.User> currentUser(
        com.grpc.Room request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_CURRENT_USER, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.grpc.Empty> rollDice(
        com.grpc.User request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_ROLL_DICE, getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<com.grpc.Empty> setTime(
        com.grpc.Time request) {
      return futureUnaryCall(
          getChannel().newCall(METHOD_SET_TIME, getCallOptions()), request);
    }
  }

  private static final int METHODID_JOIN = 0;
  private static final int METHODID_CREATE = 1;
  private static final int METHODID_GET_ALL_USERS = 2;
  private static final int METHODID_NEXT_USER = 3;
  private static final int METHODID_CURRENT_USER = 4;
  private static final int METHODID_ROLL_DICE = 5;
  private static final int METHODID_RECEIVE_ROLL_DICE = 6;
  private static final int METHODID_SET_TIME = 7;
  private static final int METHODID_START_TIMER = 8;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final QwixxServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(QwixxServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_JOIN:
          serviceImpl.join((com.grpc.User) request,
              (io.grpc.stub.StreamObserver<com.grpc.Response>) responseObserver);
          break;
        case METHODID_CREATE:
          serviceImpl.create((com.grpc.User) request,
              (io.grpc.stub.StreamObserver<com.grpc.Response>) responseObserver);
          break;
        case METHODID_GET_ALL_USERS:
          serviceImpl.getAllUsers((com.grpc.Room) request,
              (io.grpc.stub.StreamObserver<com.grpc.UserList>) responseObserver);
          break;
        case METHODID_NEXT_USER:
          serviceImpl.nextUser((com.grpc.User) request,
              (io.grpc.stub.StreamObserver<com.grpc.User>) responseObserver);
          break;
        case METHODID_CURRENT_USER:
          serviceImpl.currentUser((com.grpc.Room) request,
              (io.grpc.stub.StreamObserver<com.grpc.User>) responseObserver);
          break;
        case METHODID_ROLL_DICE:
          serviceImpl.rollDice((com.grpc.User) request,
              (io.grpc.stub.StreamObserver<com.grpc.Empty>) responseObserver);
          break;
        case METHODID_RECEIVE_ROLL_DICE:
          serviceImpl.receiveRollDice((com.grpc.Room) request,
              (io.grpc.stub.StreamObserver<com.grpc.User>) responseObserver);
          break;
        case METHODID_SET_TIME:
          serviceImpl.setTime((com.grpc.Time) request,
              (io.grpc.stub.StreamObserver<com.grpc.Empty>) responseObserver);
          break;
        case METHODID_START_TIMER:
          serviceImpl.startTimer((com.grpc.Room) request,
              (io.grpc.stub.StreamObserver<com.grpc.Time>) responseObserver);
          break;
        default:
          throw new AssertionError();
      }
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public io.grpc.stub.StreamObserver<Req> invoke(
        io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        default:
          throw new AssertionError();
      }
    }
  }

  private static final class QwixxServiceDescriptorSupplier implements io.grpc.protobuf.ProtoFileDescriptorSupplier {
    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return com.grpc.Schema.getDescriptor();
    }
  }

  private static volatile io.grpc.ServiceDescriptor serviceDescriptor;

  public static io.grpc.ServiceDescriptor getServiceDescriptor() {
    io.grpc.ServiceDescriptor result = serviceDescriptor;
    if (result == null) {
      synchronized (QwixxServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new QwixxServiceDescriptorSupplier())
              .addMethod(METHOD_JOIN)
              .addMethod(METHOD_CREATE)
              .addMethod(METHOD_GET_ALL_USERS)
              .addMethod(METHOD_NEXT_USER)
              .addMethod(METHOD_CURRENT_USER)
              .addMethod(METHOD_ROLL_DICE)
              .addMethod(METHOD_RECEIVE_ROLL_DICE)
              .addMethod(METHOD_SET_TIME)
              .addMethod(METHOD_START_TIMER)
              .build();
        }
      }
    }
    return result;
  }
}
