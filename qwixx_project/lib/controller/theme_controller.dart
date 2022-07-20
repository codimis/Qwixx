import 'package:flutter/material.dart';

class ChangeTheme extends ChangeNotifier {
  bool isLight;
  ChangeTheme(this.isLight);
  void changeTheme() async {
    isLight = !isLight;
    notifyListeners();
  }
   ThemeData get currentTheme=> !isLight ? lightTheme(): darkTheme();
  
  ThemeData lightTheme() {
    return ThemeData(
      backgroundColor: Colors.grey[200],
      appBarTheme: const AppBarTheme(
        
        color: Colors.grey,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        ),
      
    
      textTheme: const TextTheme(
        
        headline6: TextStyle(
          
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
             primary: const Color.fromARGB(255, 18, 18, 18),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),),
             padding: const EdgeInsets.all(15),
             
            textStyle: const TextStyle(
              color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            
          ),
          shadowColor: Colors.black,
        )
        )

    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
  
      
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
        
      ),
      	elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
             primary: const Color.fromARGB(255, 94, 93, 93),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),),
             padding: const EdgeInsets.all(15),
             
            textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            
          ),
          shadowColor: Colors.black,
        )
        )
    
      
    );
  }
}