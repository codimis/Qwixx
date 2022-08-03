
import 'package:flutter/material.dart';
import 'package:qwixx_project/controller/client_server_controller.dart';

import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';

class WaitingUser extends StatefulWidget {
  const WaitingUser({Key? key}) : super(key: key);

  @override
  State<WaitingUser> createState() => _WaitingUserState();
}

class _WaitingUserState extends State<WaitingUser> {
  late final ClientController clientController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectClient();
  }
  Future<void> connectClient() async {
    
        clientController=ClientController();
       await clientController.join(
            User(
            id: 20,
            queue: 1,
            room: Room(roomId: 10),
            dices: [Dice(number: 1), Dice(number: 2), Dice(number: 3), Dice(number: 4), Dice(number: 5)])
            );
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Waiting for User"),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            StreamBuilder<UserList>(stream: clientController.getAllUsers(Room(roomId: 10)),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
              else{
                if(snapshot.hasData){
                  return Text("${snapshot.data!.users.length}");
                }
                else{
                  return const Text("0");
                }
                              }
            },
            ),
              
              ],
            )
        )
      );
    
  }
}