import 'package:flutter/cupertino.dart';
import 'package:qwixx_project/model/onboarding_model.dart';


class OnboardingController extends ChangeNotifier {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  void forward() {
    if (currentPage < onboardingPages.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
      currentPage++;
      notifyListeners();
    }
  }

  void updatePage(int index) {
    currentPage = index;
    notifyListeners();
  }

  List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      animationAsset: "assets/animation/dice.json",
      title: 'Welcome to Qwixx',
      description:
          'In a game played with Qwixx dice, 6 or 8 dice are thrown for this game and the game is played according to the values of the dice thrown.',
    ),
    OnboardingModel(
      animationAsset: "assets/animation/bulb.json",
      title: 'Also, you can change the theme of the game',
      description: 'Just click the bulb',
    ),
    OnboardingModel(
      animationAsset: "assets/animation/shakePhone.json",
      title: 'Shake the phone for starting the game',
      description: 'Or pressed the button',
    ),
  ];
  
}

class ChangeTheme extends ChangeNotifier {
  bool isLight = true;
  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}