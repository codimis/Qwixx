import 'package:flutter/material.dart';
import 'package:qwixx_project/controller/client_server_controller.dart';
import 'package:qwixx_project/src/generated/proto/src/main/proto/schema.pbgrpc.dart';
import 'package:qwixx_project/view/waiting_user_view.dart';
import 'package:uuid/uuid.dart';

import '../model/default_user_model.dart';
import 'game_view.dart';

class GameChoose extends StatefulWidget {
   const GameChoose({Key? key, required this.online}) : super(key: key);
  final bool online;
  @override
  State<GameChoose> createState() => _GameChooseState();
}

class _GameChooseState extends State<GameChoose> {
  late final ClientController controller;
  var uuid=const Uuid();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=ClientController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: ()async {
                if(widget.online){
                  var newUUID=uuid.v1().substring(0,7);
                 User user=await controller.create(
                      DefaultUserModel().userModel(newUUID,false)
                  );
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  WaitingUser(side: false,user: user)),
                  );
                

                }else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const GameView(side:false)),
                  );
                }
              },
              child: Card(
                child: Column(children: [
                  SizedBox(height: 200,child: Image.asset("assets/image/6sideDice.png")),
                  const SizedBox(height: 20,),
                   Text("Play With 6 Sided Dice",style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),
                   const SizedBox(height: 20,),
                   const Text("Tap here for playing\n\nIn the game,if you want to remove the dice, please tap the dice",textAlign: TextAlign.center),
                   
                ],),
              ),
            ),
          ),
         Flexible(
          flex:1,
           child: InkWell(
              onTap: () async {
                if(widget.online){
                  var newUUID=uuid.v1().substring(0,7);
                 User user=await controller.create(
                      DefaultUserModel().userModel(newUUID,false)
                  );
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  WaitingUser(side: false,user: user)),
                  );
                

                }else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const GameView(side:false)),
                  );
                }
           
              },
              child: Card(
                child: Column(children: [
                  SizedBox(height: 200,child: Image.asset("assets/image/8sideDice.png")),
                    const SizedBox(height: 20,),
                   Text("Play With 8 Sided Dice",style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),
                   const SizedBox(height: 20,),
                   const Text("Tap here for playing\n\nIn the game,if you want to remove the dice, please tap the dice",textAlign: TextAlign.center),
                    Text("It is Coming Soon",style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),

                ],),
              ),
            ),
         )
        ],),
      )
    );
  }
}