import "dart:math";

import 'package:flutter/cupertino.dart';
import 'package:qwixx_project/model/8side_model.dart';


class EightSideDiceController extends ChangeNotifier {

  int firstWhiteDice=1;
  int secondWhiteDice=1;
  int greenDice=1;
  int redDice=1;
  int blueDice=1;
  int yellowDice=1;
  
 
  List<Dice> dices = [
    Dice(color: 'white', path: "assets/image/whiteDice/", enable: true),
    Dice(color: 'white', path: "assets/image/whiteDice/",enable: true),
    Dice(color: 'blue', path: "assets/image/blueDice/",enable: true),
    Dice(color: 'green', path: "assets/image/greenDice/",enable: true),
    Dice(color: 'red', path: "assets/image/redDice/",enable: true),
    Dice(color: 'yellow', path: "assets/image/yellowDice/",enable: true),
  ];

  String refreshDice(int i){
    String path="";
      if(dices[i].enable){
        switch (i){
          case 0:
            path+="${dices[i].path}${dices[i].color}$firstWhiteDice.png";
            break;
          case 1:
            path+="${dices[i].path}${dices[i].color}$secondWhiteDice.png";
            
            break;
          case 2:
          path+="${dices[i].path}${dices[i].color}$blueDice.png";
           
            break;
          case 3:
           path+="${dices[i].path}${dices[i].color}$greenDice.png";
            
            break;
          case 4:
           path+="${dices[i].path}${dices[i].color}$redDice.png";
            
            break;
          case 5:
            path+="${dices[i].path}${dices[i].color}$yellowDice.png";
            break;
        }
      }
    

    return path;

  }




  void disableDice(int index) {
    dices[index].enable = false;
    notifyListeners();
  }


  void enableAllDice() {
    for (int i = 0; i < dices.length; i++) {
      dices[i].enable = true;
    }
    notifyListeners();
  }
  void rollDice(bool isTimeFinished,isRolled,timeSetted,AnimationController animationController,bool sixSide) {

      isRolled=true;
      if (isRolled&&timeSetted) {
      animationController.reverse(
          from: animationController.value == 0
              ? 1
              : animationController.value);
    }
    if(sixSide){
      firstWhiteDice = Random().nextInt(6) + 1;
    secondWhiteDice = Random().nextInt(6) + 1;
    greenDice = Random().nextInt(6) + 1;
    redDice = Random().nextInt(6) + 1;
    blueDice = Random().nextInt(6) + 1;
    yellowDice = Random().nextInt(6) + 1;
    }else{
firstWhiteDice = Random().nextInt(8) + 1;
    secondWhiteDice = Random().nextInt(8) + 1;
    greenDice = Random().nextInt(8) + 1;
    redDice = Random().nextInt(8) + 1;
    blueDice = Random().nextInt(8) + 1;
    yellowDice = Random().nextInt(8) + 1;
    }
    

    
    notifyListeners();
  }

 


}