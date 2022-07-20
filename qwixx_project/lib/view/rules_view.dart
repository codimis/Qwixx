import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RulesView extends StatefulWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  State<RulesView> createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("Rules"),
      ),
      body: const Center(
        child: Text("Rules"),
      ),
    
    );
  }
}