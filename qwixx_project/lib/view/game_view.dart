import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

import '../controller/game_controller.dart';
import 'home_view.dart';



class GameView extends StatefulWidget {
  final bool side;

  const GameView({Key? key,required this.side}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with TickerProviderStateMixin{
  late AnimationController _animationControllerTimer;
  bool isTimeFinished=false;
 int counterTime = 0;
   late bool timeSetted=false;
  late bool isRolled=false;
  late ShakeDetector detector;
  @override
  void initState() {
    super.initState();
    animationTime();
    shake();

  }
  void shake(){
    ShakeDetector detector = ShakeDetector.autoStart(
    onPhoneShake: () {
    Provider.of<EightSideDiceController>(context, listen: false).rollDice(isTimeFinished,isRolled,timeSetted,_animationControllerTimer,widget.side);
    },
    );
    
    }


  
   void animationTime(){
      _animationControllerTimer = AnimationController(vsync: this);
      _animationControllerTimer.addListener(() { 
        if(_animationControllerTimer.value==0){
          setState(() {
                isTimeFinished=true;

          });
        }
      });
  }


  @override
  void dispose() {
    _animationControllerTimer.dispose();
    detector.stopListening();
    super.dispose();
  }
  
  String get countText {

          Duration count =
        _animationControllerTimer.duration! * _animationControllerTimer.value;
        return count.inSeconds.toString();

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
              Provider.of<EightSideDiceController>(context, listen: false).enableAllDice();
              isRolled=false;
              setState(() {
                  _animationControllerTimer.reset();
                  isTimeFinished=false;
              });
            

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
          height: MediaQuery.of(context).size.height,
          child: Container(
            color:isTimeFinished?Colors.red:null,
            child: Column(children: [
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                    Flexible(
                        fit: FlexFit.tight,
                        child:NumberWidget(color:Colors.white,number: 0,) 
                        
                            ),
                    Flexible(
                        fit: FlexFit.tight,
                        child:NumberWidget(color:Colors.white,number: 1,) 
                        
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(children: [
                   Provider.of<EightSideDiceController>(context,listen:true).dices[2].enable
                      ? Flexible(
                        fit:FlexFit.tight,
                        child: InkWell(
                            onTap: () => Provider.of<EightSideDiceController>(context,listen:false).disableDice(2),
                            child:const NumberWidget(color:Colors.blue,number: 2,) ),
                      )
                      : Container(),
                  Provider.of<EightSideDiceController>(context,listen:false).dices[3].enable
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: () {Provider.of<EightSideDiceController>(context,listen:false).disableDice(3);setState(){}},
                              child:const NumberWidget(color:Colors.green,number: 3,) )
                      )
                      : Container(),
                ]),
              ),
              Flexible(
                flex: 2,
                child: Row(children: [
                  Provider.of<EightSideDiceController>(context,listen:false).dices[4].enable
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: () => Provider.of<EightSideDiceController>(context,listen:false).disableDice(4),
                              child: const NumberWidget(color:Colors.red,number: 4,))
                      )
                      : Container(),
                  Provider.of<EightSideDiceController>(context,listen:false).dices[5].enable
                      ? Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                              onTap: (() => Provider.of<EightSideDiceController>(context,listen:false).disableDice(5)),
                              child: const NumberWidget(color:Colors.yellow,number: 5,) )
                      )
                      : Container(),
                ]),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<EightSideDiceController>(context,listen:false).rollDice(isTimeFinished,isRolled,timeSetted,_animationControllerTimer,widget.side);
                       if(isTimeFinished==true){
                        isRolled=false;
                        timeSetted=true;
                        isTimeFinished=false;
                      }
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
                            timeSetted=false;
                            counterTime = 0;
                          } else if (value == "0") {
                            timeSetted=false;
                            counterTime = 0;
                          } else {
                            counterTime = int.parse(value);
                            print(value);
                            _animationControllerTimer.duration =
                                Duration(seconds: int.parse(value));
                                timeSetted=true;
                                isRolled=false;

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

class NumberWidget extends StatelessWidget {
  final number;
  final color;
  const NumberWidget({
    Key? key, this.number, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.all(10),child: Image.asset(Provider.of<EightSideDiceController>(context,listen:true).refreshDice(number)));
  }
}