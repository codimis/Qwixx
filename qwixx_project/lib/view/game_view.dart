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
  late AnimationController _animationControllerDice;
  late AnimationController _animationControllerTimer;
  late int counterTime = 0;
  bool timer = false;
  bool isTimeFinished=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
    animateDice();
    animationTime();
    _shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      roll();
    });
  }
  animationTime(){
      _animationControllerTimer = AnimationController(vsync: this);
      _animationControllerTimer.addListener(() { 
        if(_animationControllerTimer.value==0){
          setState(() {
            isTimeFinished=true;
          });
        }
      });
  
  }
  void animateDice() {
    _animationControllerDice = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationControllerDice.addListener(() {
      setState(() {});
    });

    _animationControllerDice.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerDice.reverse();
      }
    });
  }
  void finishTimer(){
    if(timeSetted&&countText=="0"){
      setState((){
          isTimeFinished=true;
      });
    }
  }

  String get countText {
    Duration count =
        _animationControllerTimer.duration! * _animationControllerTimer.value;
    return count.inSeconds.toString();
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
    _animationControllerDice.dispose();
    _animationControllerTimer.dispose();
  }

  bool okay = true;
  bool timeSetted = false;
  bool isRolled = false;
  int firstWhiteDice = 1;
  int secondWhiteDice = 1;
  int greenDice = 1;
  int redDice = 1;
  int blueDice = 1;
  int yellowDice = 1;
  bool red = true;
  bool blue = true;
  bool green = true;
  bool yellow = true;
  void roll() {
    
    if(isTimeFinished==false){
      _animationControllerDice.forward();
    setState(() {
      isRolled = true;
       if (isRolled&&timeSetted) {
      _animationControllerTimer.reverse(
          from: _animationControllerTimer.value == 0
              ? 1
              : _animationControllerTimer.value);
    }
      firstWhiteDice = Random().nextInt(6) + 1;
      secondWhiteDice = Random().nextInt(6) + 1;
      greenDice = Random().nextInt(6) + 1;
      redDice = Random().nextInt(6) + 1;
      blueDice = Random().nextInt(6) + 1;
      yellowDice = Random().nextInt(6) + 1;
    });
  }
  }

  refreshColor() {
    setState(() {
      _animationControllerTimer.reset();
      isTimeFinished=false;

      isRolled = false;
      red = true;
      blue = true;
      green = true;
      yellow = true;
    });
  }

  deleteColor(String color) {
    setState(() {
      if (color == "red") {
        red = false;
      }
      if (color == "blue") {
        blue = false;
      }
      if (color == "green") {
        green = false;
      }
      if (color == "yellow") {
        yellow = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: timeSetted
            ? AnimatedBuilder(
                animation: _animationControllerTimer,
                builder: (context, child) => countText != "0"
                    ? Text("$countText Seconds left")
                    : Text("$counterTime Seconds left"))
            : const Text("Good luck"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeView()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              refreshColor();
            },
          ),
          IconButton(
            icon: const Icon(Icons.timer),
            onPressed: () {
              dialogMessages(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          
          height: (_animationControllerDice.value == 0
                  ? 1
                  : _animationControllerDice.value) *
              MediaQuery.of(context).size.height,
          child: Container(
            color:isTimeFinished?Colors.red:null,
            child: Column(children: [
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Image.asset(
                            "assets/image/whiteDice/dice-png-$firstWhiteDice.png")),
                    Flexible(
                        fit: FlexFit.tight,
                        child: Image.asset(
                            "assets/image/whiteDice/dice-png-$secondWhiteDice.png")),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(children: [
                  blue
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: () => deleteColor("blue"),
                              child: Image.asset(
                                  "assets/image/blueDice/blue$blueDice.png")))
                      : Container(),
                  green
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: () => deleteColor("green"),
                              child: Image.asset(
                                  "assets/image/greenDice/green$greenDice.png")))
                      : Container(),
                ]),
              ),
              Flexible(
                flex: 2,
                child: Row(children: [
                  red
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: () => deleteColor("red"),
                              child: Image.asset(
                                  "assets/image/redDice/red$redDice.png")))
                      : Container(),
                  yellow
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: (() => deleteColor("yellow")),
                              child: Image.asset(
                                  "assets/image/yellowDice/yellow$yellowDice.png")))
                      : Container(),
                ]),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    roll();
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text("Roll"),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<dynamic> dialogMessages(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Set timer"),
                content: const Text("0 to remove timer"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90),
                    child: TextField(
                      keyboardAppearance: Brightness.light,
                      decoration: const InputDecoration(
                        labelText: "Enter time",
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value == "") {
                            timeSetted = false;
                            counterTime = 0;
                          } else if (value == "0") {
                            timeSetted = false;
                            counterTime = 0;
                          } else {
                            counterTime = int.parse(value);
                            print(value);
                            _animationControllerTimer.duration =
                                Duration(seconds: int.parse(value));

                            timeSetted = true;
                            isRolled = false;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Okay"))
                ]));
  }
}
