import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:qwixx_project/controller/onborading_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
  var darkModeOn = prefs.getBool('darkMode') ?? true;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ChangeTheme>(create: (context) => ChangeTheme(darkModeOn)),
      ChangeNotifierProvider<OnboardingController>(
          create: (context) => OnboardingController()),
    ],
    builder: (context, child) => const MyApp(),
  ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ChangeTheme>().currentTheme,
      home: SplashScreen(),
    );
  }
}