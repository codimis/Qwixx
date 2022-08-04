import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';
class DefaultUserModel {
  
   User userModel(id,bool? sixSide){
    return User(id: id ,
            room: Room(roomId:id,sixSide: sixSide),
            dices: 
            [Dice(number: 6,diceColor: Dice_Type.white),
            Dice(number: 6,diceColor: Dice_Type.secondWhite),
            Dice(number: 6,diceColor: Dice_Type.blue),
            Dice(number: 6,diceColor: Dice_Type.green),
            Dice(number: 6,diceColor: Dice_Type.red),
            Dice(number: 6,diceColor: Dice_Type.yellow),
            ]);


  }



}