
import 'package:shared_preferences/shared_preferences.dart';

class Location {
  static void location(String locate) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('locations', locate);
    
  }

}