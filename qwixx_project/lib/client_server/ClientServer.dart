
import 'package:grpc/grpc.dart';

import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';

class ClientServerConnection{
QwixxServiceClient createClient() {
  return QwixxServiceClient(
    ClientChannel("10.0.2.2", port:9000,
    options:const ChannelOptions(credentials: ChannelCredentials.insecure())));
}
}