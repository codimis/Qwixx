import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:qwixx_project/controller/onborading_controller.dart';
import 'package:qwixx_project/view/onborading_screens/first_onboardingscreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
       ChangeNotifierProvider<ChangeTheme>(create: (context) => ChangeTheme()),
        ChangeNotifierProvider<OnboardingController>(create: (context) => OnboardingController()),
    ],
    builder: (context,child)=>const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ChangeTheme>().isLight? lightTheme():darkTheme(),
      home:  FirstOnboardingScreen(theme:context.watch<ChangeTheme>().isLight ? lightTheme():darkTheme()),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
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
      )
    
      
    );
  }
}

