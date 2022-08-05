
import 'package:flutter/material.dart';
import 'package:qwixx_project/src/generated/proto/src/main/proto/schema.pb.dart';

import '../controller/client_server_controller.dart';

class OnlineGameView extends StatefulWidget {
  const OnlineGameView({Key? key, required this.side, required this.user}) : super(key: key);
   final bool side;
   final User user;
  @override
  State<OnlineGameView> createState() => _OnlineGameViewState();
}

class _OnlineGameViewState extends State<OnlineGameView> {
  late final ClientController controller;
  bool isThisCurrentUser=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   controller=ClientController();
    
  }

    
  

  void nextUser()async{
   await controller.nextUser(widget.user.room);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          children: [
            StreamBuilder<User>(builder: (context, snapshot) {
              if (snapshot.hasData) {
   
                if ((snapshot.data!.id).contains( widget.user.id)) {

                  return ElevatedButton(onPressed: (){
                    setState(() {
                      
                    });
                    nextUser();
                  },child: const Text("Next User"),);
                }
                
              }
              return const Text("");
            }, stream: controller.currenUser(widget.user.room),
            
            ),
        
          

       ] )
        
        
      )
    );
  }
}