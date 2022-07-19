import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'first_onboardingscreen.dart';
import 'home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var locations = preferences.getString('locations');
        print(locations);
        print("here");
        if (locations == "HomeScreen") {
          print("home");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const HomeView()));
        } 
         if (locations == "onBoarding" ) {
          print("onBoarding");
          Navigator.pushReplacement (
              context, MaterialPageRoute(builder: (context) => const FirstOnboardingScreen()));
        }
        if (locations != "onBoarding" && locations == null) {
          print("onBoarding");
          Navigator.pushReplacement (
              context, MaterialPageRoute(builder: (context) => const FirstOnboardingScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,child: Image.asset("assets/image/firstScreen.jpg"),));
  }
}