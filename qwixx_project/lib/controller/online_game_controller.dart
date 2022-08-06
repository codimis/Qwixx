import "dart:math";

import 'package:flutter/cupertino.dart';

import '../src/generated/proto/src/main/proto/schema.pb.dart';
import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';
import 'client_server_controller.dart';


class OnlineGameController extends ClientController {


  int firstWhiteDice=1;
  int secondWhiteDice=1;
  int greenDice=1;
  int redDice=1;
  int blueDice=1;
  int yellowDice=1;
  List<Dice> dices = [
    Dice(diceColor: Dice_Type.white, path: "assets/image/whiteDice/", enable: true,number: 1),
    Dice(diceColor: Dice_Type.secondWhite, path: "assets/image/whiteDice/",enable: true,number: 1),
    Dice(diceColor: Dice_Type.blue, path: "assets/image/blueDice/",enable: true,number: 1),
    Dice(diceColor: Dice_Type.green, path: "assets/image/greenDice/",enable: true,number: 1),
    Dice(diceColor: Dice_Type.red, path: "assets/image/redDice/",enable: true,number: 1),
    Dice(diceColor: Dice_Type.yellow, path: "assets/image/yellowDice/",enable: true,number: 1),
  ];
  List<Dice> getAllDice(){
    return dices;
  }
  void disableDice(Dice_Type color,User user) {
    for (var element in dices) {
      if(element.diceColor==color){
        element.enable=false;
      }
    }
    user.dices.clear();
    user.dices.addAll(dices);    
    updateDices(user);
  }


  void enableAllDice(User user) {
    for (int i = 0; i < dices.length; i++) {
      dices[i].enable = true;
    }
    user.dices.clear();
    user.dices.addAll(dices);
    updateDices(user);
  }
  void rollDice(bool isTimeFinished,isRolled,timeSetted,AnimationController animationController,bool sixSide,User user) {

      isRolled=true;
      if (isRolled&&timeSetted) {
      animationController.reverse(
          from: animationController.value == 0
              ? 1
              : animationController.value);
    }
    if(sixSide){

    for (var element in dices) {
      element.number=Random().nextInt(6) + 1;
      }
    }else{
      for (var element in dices) {
          element.number=Random().nextInt(8) + 1;
      }
    }
    user.dices.clear();
    user.dices.addAll(dices);
    updateDices(user);
  }

}