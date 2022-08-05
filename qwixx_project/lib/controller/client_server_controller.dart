import 'package:grpc/grpc.dart' show CallOptions, ChannelCredentials, ChannelOptions, ClientChannel;

import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';

class ClientController{

late final ClientChannel  _clientServerConnection;
late final QwixxServiceClient stub;
  
  ClientController(){
    _clientServerConnection=createClient();
    stub=QwixxServiceClient(_clientServerConnection);
    
  }
  void shutDownChannel(){
    _clientServerConnection.shutdown();
  }
   ClientChannel createClient() {
  return 
    ClientChannel("10.0.2.2", port:9000,
    options:const ChannelOptions(credentials: ChannelCredentials.insecure()));
  }


 
  Stream<UserList> getAllUsers(Room room) async* {
    await for (var msg in stub.getAllUsers(room)) {
      yield msg;
    }
      
  }

 Future<User> join(User user) async {
    User response = await stub.join(user);

    return response;
  }
  Future<User> create(User user)async{
    User response = await stub.create(user);
    return response;
  }
  Future<void> setTime(Time time)async{
     await stub.setTime(time);
     
  }
   Stream<Time> startTimer(Room room) async* {
   Stream<Time> stream=stub.startTimer(room).asBroadcastStream();
   yield* stream;
  }
  
  Stream<User> currenUser(Room room)async*{

    await for (var users in stub.currentUser(room)) {
      
      yield users;
    }
  
  }
  Future<User> nextUser(Room room)async{
    User stream=await stub.nextUser(room);
     return stream;
  }
  void startGame(Room room)async{
    await stub.startGame(room);
  }
  Stream<Room> getStartedGame(Room room)async*{
    await for (var room in stub.getStartedGame(room)) {
      yield room;
    }
  }
}
