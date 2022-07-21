import "dart:math";

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_view.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with TickerProviderStateMixin {
  late ShakeDetector _shakeDetector;
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
    animate();
     _shakeDetector=ShakeDetector.autoStart(onPhoneShake: (){
       roll();

    });
  }
  void animate(){
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _animationController.reverse();
      }
    });
  }
    void location() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('locations', "gameScreen");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _shakeDetector.stopListening();
  }
  int firstWhiteDice=1;
  int secondWhiteDice=1;
  int greenDice=1;
  int redDice=1;
  int blueDice=1;
  int yellowDice=1;
  bool red=true;
  bool blue=true;
  bool green=true;
  bool yellow=true;
  void roll(){
    _animationController.forward();
    setState(() {
      firstWhiteDice=Random().nextInt(6)+1;
      secondWhiteDice=Random().nextInt(6)+1;
      greenDice=Random().nextInt(6)+1;
      redDice=Random().nextInt(6)+1;
      blueDice=Random().nextInt(6)+1;
      yellowDice=Random().nextInt(6)+1;
    });

  }
  refreshColor(){
    setState(() {
      red=true;
      blue=true;
      green=true;
      yellow=true;
    });
  }
  deleteColor(String color){
    setState(() {
      if(color=="red"){
        red=false;
      }
      if(color=="blue"){
        blue=false;
      }
      if(color=="green"){
        green=false;
      }
      if(color=="yellow"){
        yellow=false;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeView()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: (){
              refreshColor();
            },
          )
        
        ],
      ),
      body: SizedBox(
        height:(_animationController.value==0?1:_animationController.value)*MediaQuery.of(context).size.height,
        child: Column(children: [
          Flexible(
            flex: 2,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Flexible(fit: FlexFit.tight,child: Image.asset("assets/image/whiteDice/dice-png-$firstWhiteDice.png")),
               Flexible(fit: FlexFit.tight,child: Image.asset("assets/image/whiteDice/dice-png-$secondWhiteDice.png")),
              ],),
          ),
          Flexible(
            flex: 2,
            child: Row(children: [
                blue?Flexible(fit:FlexFit.tight,child: InkWell(onTap: () => deleteColor("blue"),child: Image.asset("assets/image/blueDice/blue$blueDice.png"))):Container(),
               green?Flexible(fit: FlexFit.tight,child: InkWell(onTap: () => deleteColor("green"),child: Image.asset("assets/image/greenDice/green$greenDice.png"))):Container(),
            ]),
          ),
          Flexible(
            flex:2,
            child: Row(children: [
              red?Flexible(fit: FlexFit.tight,child: InkWell(onTap: () => deleteColor("red"),child: Image.asset("assets/image/redDice/red$redDice.png"))):Container(),
               yellow?Flexible(fit: FlexFit.tight,child: InkWell(onTap: (() => deleteColor("yellow")),child: Image.asset("assets/image/yellowDice/yellow$yellowDice.png"))):Container(),
            ]),
          ),
          Flexible(
            flex:1,
            child: ElevatedButton(onPressed: (){
              roll();
            },style: Theme.of(context).elevatedButtonTheme.style, child: const Text("Roll"),),
          ),
        ]),
      ),
    );
  }
}