import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_view.dart';
import 'onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        await navigatorConditions();
      },
    );
  }

  Future<void> navigatorConditions() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var locations = preferences.getString('locations');
    if (locations == "HomeScreen") {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    } 
     if (locations == "onBoarding" ) {

      Navigator.pushReplacement (
          context, MaterialPageRoute(builder: (context) => const FirstOnboardingScreen()));
    }
    if (locations != "onBoarding" && locations == null) {
      Navigator.pushReplacement (
          context, MaterialPageRoute(builder: (context) => const FirstOnboardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Lottie.asset('assets/animation/splashAnimation.json'))
        );
  }
}