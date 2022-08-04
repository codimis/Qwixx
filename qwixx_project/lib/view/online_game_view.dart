import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qwixx_project/src/generated/proto/src/main/proto/schema.pb.dart';

class OnlineGameView extends StatefulWidget {
  const OnlineGameView({Key? key, required this.side, required this.user}) : super(key: key);
   final bool side;
   final User user;
  @override
  State<OnlineGameView> createState() => _OnlineGameViewState();
}

class _OnlineGameViewState extends State<OnlineGameView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("OnlineGameView"),
        
      ),  
    );
  }
}