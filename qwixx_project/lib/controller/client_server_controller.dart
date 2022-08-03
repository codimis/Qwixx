import '../client_server/ClientServer.dart';
import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';

class ClientController {
  late final QwixxServiceClient  _clientServerConnection=ClientServerConnection().createClient();

  Stream<UserList> getAllUsers(Room room) async* {
      Stream<UserList> stream= _clientServerConnection.getAllUsers(room).asBroadcastStream();
      yield* stream;
  }

 Future<Response> join(User user) async {
    Response response = await _clientServerConnection.join(user);
        print(response);

    return response;
  }
  Future<Response> create(User user)async{
    Response response = await _clientServerConnection.create(user);
      print(response);
    return response;
  }
  Future<void> setTime(Time time)async{
     await _clientServerConnection.setTime(time);
     
  }
   Stream<Time> startTimer(Room room) async* {
   Stream<Time> stream=_clientServerConnection.startTimer(room).asBroadcastStream();
   yield* stream;

  }
}
