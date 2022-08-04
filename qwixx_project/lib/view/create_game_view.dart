
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:qwixx_project/model/default_user_model.dart';
import 'package:qwixx_project/view/waiting_user_view.dart';

import '../controller/client_server_controller.dart';
import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';
import 'game_choose_dart.dart';



class CreateGameView extends StatefulWidget {
  const CreateGameView({Key? key}) : super(key: key);

  @override
  State<CreateGameView> createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  late final  TextEditingController textController;
  late final ClientController clientController;
  final String headline="Game Time";
  final String subheadline="Create a Game or Join a Game";
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController=TextEditingController();
    connectClient();
  }
  void connectClient() {
        clientController=ClientController();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(headline),
        centerTitle: true,
      ),
      body: ListView(
        children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(subheadline,
            textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline3))
          ,Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              
                TextWidget(textController: textController),
                const SizedBox(height: 20,),
                SizedBox(width:MediaQuery.of(context).size.width,child: LoginButton(textController: textController,client: clientController,)),
                const SizedBox(height: 15),
                 SizedBox(width: MediaQuery.of(context).size.width,child: CreateButton(textController: textController,client: clientController,)),
                Padding(padding: const EdgeInsets.only(top: 10),child: SizedBox(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.3,child: Lottie.asset("assets/animation/createGame.json"))),
            ],
                  ),
          ),]
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({
    Key? key,
    required this.textController,
    required this.client,
  }) : super(key: key);
    final TextEditingController textController;
    final ClientController client;

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: () async {

          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const GameChoose(online:true)));
           
        },
        child: const Text("Create"),
      );
      }
}
class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.textController,
     required this.client,
  }) : super(key: key);
    final TextEditingController textController;
        final ClientController client;
  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: ()async{
          if(textController.text!=""){
            Future<User> response= client.join(
              DefaultUserModel().userModel(textController.text,null)
            );
            response.then((value) => 
            Navigator.push(context, MaterialPageRoute(builder: (context)=> WaitingUser(side: value.room.sixSide,user: value)))
            );
          }
          
          
        },
        child: const Text("Join"),
      );
      }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child:  TextField(
          controller: textController,
          textAlign: TextAlign.start,
          inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
        
          decoration: InputDecoration(

            labelText: "Game Id",
            border: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(10),
    
            ),
            prefixIcon: const Icon(Icons.games_outlined),

          ),
        ),
      ),
    );
  }
}