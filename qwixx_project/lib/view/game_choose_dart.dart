import 'package:flutter/material.dart';

import 'game_view.dart';

class GameChoose extends StatefulWidget {
  const GameChoose({Key? key}) : super(key: key);

  @override
  State<GameChoose> createState() => _GameChooseState();
}

class _GameChooseState extends State<GameChoose> {
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameView()),
                );
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
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const GameChooseDart()),
                // );
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