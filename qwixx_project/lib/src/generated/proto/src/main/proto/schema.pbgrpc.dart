///
//  Generated code. Do not modify.
//  source: proto/src/main/proto/schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'schema.pb.dart' as $0;
export 'schema.pb.dart';

class QwixxServiceClient extends $grpc.Client {
  static final _$join = $grpc.ClientMethod<$0.User, $0.User>(
      '/com.grpc.QwixxService/join',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$0.User, $0.User>(
      '/com.grpc.QwixxService/create',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$getAllUsers = $grpc.ClientMethod<$0.Room, $0.UserList>(
      '/com.grpc.QwixxService/getAllUsers',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserList.fromBuffer(value));
  static final _$nextUser = $grpc.ClientMethod<$0.Room, $0.User>(
      '/com.grpc.QwixxService/nextUser',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$currentUser = $grpc.ClientMethod<$0.Room, $0.User>(
      '/com.grpc.QwixxService/currentUser',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$rollDice = $grpc.ClientMethod<$0.User, $0.Empty>(
      '/com.grpc.QwixxService/rollDice',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$receiveRollDice = $grpc.ClientMethod<$0.Room, $0.User>(
      '/com.grpc.QwixxService/receiveRollDice',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$setTime = $grpc.ClientMethod<$0.Time, $0.Empty>(
      '/com.grpc.QwixxService/setTime',
      ($0.Time value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$startTimer = $grpc.ClientMethod<$0.Room, $0.Time>(
      '/com.grpc.QwixxService/startTimer',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Time.fromBuffer(value));
  static final _$startGame = $grpc.ClientMethod<$0.Room, $0.Empty>(
      '/com.grpc.QwixxService/startGame',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getStartedGame = $grpc.ClientMethod<$0.Room, $0.Room>(
      '/com.grpc.QwixxService/getStartedGame',
      ($0.Room value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Room.fromBuffer(value));

  QwixxServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.User> join($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$join, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> create($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseStream<$0.UserList> getAllUsers($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getAllUsers, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.User> nextUser($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$nextUser, request, options: options);
  }

  $grpc.ResponseStream<$0.User> currentUser($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$currentUser, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> rollDice($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rollDice, request, options: options);
  }

  $grpc.ResponseStream<$0.User> receiveRollDice($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$receiveRollDice, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> setTime($0.Time request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setTime, request, options: options);
  }

  $grpc.ResponseStream<$0.Time> startTimer($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$startTimer, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> startGame($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startGame, request, options: options);
  }

  $grpc.ResponseStream<$0.Room> getStartedGame($0.Room request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getStartedGame, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class QwixxServiceBase extends $grpc.Service {
  $core.String get $name => 'com.grpc.QwixxService';

  QwixxServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.User>(
        'join',
        join_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.User>(
        'create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.UserList>(
        'getAllUsers',
        getAllUsers_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.UserList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.User>(
        'nextUser',
        nextUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.User>(
        'currentUser',
        currentUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.Empty>(
        'rollDice',
        rollDice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.User>(
        'receiveRollDice',
        receiveRollDice_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Time, $0.Empty>(
        'setTime',
        setTime_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Time.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.Time>(
        'startTimer',
        startTimer_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.Time value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.Empty>(
        'startGame',
        startGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Room, $0.Room>(
        'getStartedGame',
        getStartedGame_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Room.fromBuffer(value),
        ($0.Room value) => value.writeToBuffer()));
  }

  $async.Future<$0.User> join_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return join(call, await request);
  }

  $async.Future<$0.User> create_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return create(call, await request);
  }

  $async.Stream<$0.UserList> getAllUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async* {
    yield* getAllUsers(call, await request);
  }

  $async.Future<$0.User> nextUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async {
    return nextUser(call, await request);
  }

  $async.Stream<$0.User> currentUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async* {
    yield* currentUser(call, await request);
  }

  $async.Future<$0.Empty> rollDice_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return rollDice(call, await request);
  }

  $async.Stream<$0.User> receiveRollDice_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async* {
    yield* receiveRollDice(call, await request);
  }

  $async.Future<$0.Empty> setTime_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Time> request) async {
    return setTime(call, await request);
  }

  $async.Stream<$0.Time> startTimer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async* {
    yield* startTimer(call, await request);
  }

  $async.Future<$0.Empty> startGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async {
    return startGame(call, await request);
  }

  $async.Stream<$0.Room> getStartedGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Room> request) async* {
    yield* getStartedGame(call, await request);
  }

  $async.Future<$0.User> join($grpc.ServiceCall call, $0.User request);
  $async.Future<$0.User> create($grpc.ServiceCall call, $0.User request);
  $async.Stream<$0.UserList> getAllUsers(
      $grpc.ServiceCall call, $0.Room request);
  $async.Future<$0.User> nextUser($grpc.ServiceCall call, $0.Room request);
  $async.Stream<$0.User> currentUser($grpc.ServiceCall call, $0.Room request);
  $async.Future<$0.Empty> rollDice($grpc.ServiceCall call, $0.User request);
  $async.Stream<$0.User> receiveRollDice(
      $grpc.ServiceCall call, $0.Room request);
  $async.Future<$0.Empty> setTime($grpc.ServiceCall call, $0.Time request);
  $async.Stream<$0.Time> startTimer($grpc.ServiceCall call, $0.Room request);
  $async.Future<$0.Empty> startGame($grpc.ServiceCall call, $0.Room request);
  $async.Stream<$0.Room> getStartedGame(
      $grpc.ServiceCall call, $0.Room request);
}
