import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  initState()  {
    // TODO: implement initState
    super.initState();
     location();
  }
  void location() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('locations', "HomeScreen");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}