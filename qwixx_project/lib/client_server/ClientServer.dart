
import 'package:grpc/grpc.dart';

import './../src/generated/src/main/proto/schema.pb.dart';
import './../src/generated/src/main/proto/schema.pbgrpc.dart';


QwixxServiceClient createClient() {
  return QwixxServiceClient(
    ClientChannel("10.0.2.2", port:9000,
    options:const ChannelOptions(credentials: ChannelCredentials.insecure())));
}
  void main(List<String> args) async{
  final client = createClient();
  await client.setTime(Time(room: Room(roomId: 10),time: 20));
  client.startTimer(Room(roomId: 10)).asBroadcastStream().listen((event) {
    print(event.time);
  });
  

}