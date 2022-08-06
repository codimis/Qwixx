
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
  late User currentUser=widget.user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   controller=ClientController();


  }
  Stream<User> listenCurrentUser() async*{
    var response =controller.currenUser(widget.user.room);
    await for(User v in response) {
      if(v.id!=currentUser.id){
        setState(() {
          currentUser=v;
        });
        
      }
      yield v;
    }
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
            StreamBuilder<User>(builder: (context,snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data!.id);
              }
              return const Text("");
            },stream: controller.receiveDice(widget.user.room,currentUser)),

            StreamBuilder<User>(builder: (context, snapshot) {
              if (snapshot.hasData) {
                if ((snapshot.data!.id).contains( widget.user.id)) {
                     

                  return ElevatedButton(onPressed: (){
                    setState(() {
                       currentUser=snapshot.data!;
                    });
                    nextUser();
                  },child: const Text("Next User"),);
                }
                
              }
              return const Text("");
            }, stream: listenCurrentUser(),
            
            ),
        
          

       ] )
        
        
      )
    );
  }
}