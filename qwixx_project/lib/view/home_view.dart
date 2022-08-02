import 'package:flutter/material.dart';
import "package:lottie/lottie.dart";
import 'package:provider/provider.dart';
import 'package:qwixx_project/view/create_game_view.dart';
import 'package:qwixx_project/view/rules_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/setLoacation.dart';
import '../controller/theme_controller.dart';
import 'game_choose_dart.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController controller = PageController();
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    Location.location("HomeScreen");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children:   const [
          TopWidget(),
          ButtonsRowWidget(),
          PlayFriendsWidget(),
           ThemeChangeWidget(),

        ],
      ),
    ));
  }
}

class PlayFriendsWidget extends StatelessWidget {
  const PlayFriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateGameView(),
            ),
          );
      }, child: const Text("Play with Friends")),
    );
  }
}

class ThemeChangeWidget extends StatelessWidget {
  const ThemeChangeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        child: const Text("Theme Change"),
        onPressed: () async {
          context.read<ChangeTheme>().changeTheme();
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(
              'darkMode', context.read<ChangeTheme>().isLight);
        },
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height:MediaQuery.of(context).size.height*0.4,child: Lottie.asset("assets/animation/homeAnimation.json")),
      Text(
        "Qwixx",
        style: Theme.of(context).textTheme.headline3,
      )
    ]);
  }
}

class ButtonsRowWidget extends StatelessWidget {
  const ButtonsRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          StartGameButtonWidget(),
          SizedBox(width: 20),
          RulesButtonWidget(),
        ],
      ),
    );
  }
}

class RulesButtonWidget extends StatelessWidget {
  const RulesButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        child: const Text("Rules"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RulesView(),
            ),
          );
        },
      ),
    );
  }
}

class StartGameButtonWidget extends StatelessWidget {
  const StartGameButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        child: const Text("Start Game"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GameChoose(),
            ),
          );
        },
      ),
    );
  }
}
