import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class CreateGameView extends StatefulWidget {
  const CreateGameView({Key? key}) : super(key: key);

  @override
  State<CreateGameView> createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  late final  TextEditingController textController;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController=TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Time"),
        centerTitle: true,
      ),
      body: Column(
        children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text("Create a Game or Join a Game",
            textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline3))
          ,Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              
                TextWidget(textController: textController),
                const SizedBox(height: 20,),
                SizedBox(width:MediaQuery.of(context).size.width,child: LoginButton(textController: textController)),
                const SizedBox(height: 15),
                 SizedBox(width: MediaQuery.of(context).size.width,child: CreateButton(textController: textController)),
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
  }) : super(key: key);
    final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        
        onPressed: (){
          Navigator.pop(context, textController.text);
        },
        child: const Text("Create"),
      );
      }
}
class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.textController,
  }) : super(key: key);
    final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: (){
          Navigator.pop(context, textController.text);
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
          onChanged: (value) => {
            textController.text=value
          },
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