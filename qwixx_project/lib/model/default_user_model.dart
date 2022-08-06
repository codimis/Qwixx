import '../controller/online_game_controller.dart';
import '../src/generated/proto/src/main/proto/schema.pbgrpc.dart';
class DefaultUserModel {
  
   User userModel(id,bool? sixSide){
    return User(
            room: Room(roomId:id,sixSide: sixSide),
            dices: OnlineGameController().getAllDice());


  }



}