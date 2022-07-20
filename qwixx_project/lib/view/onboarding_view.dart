
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qwixx_project/controller/onborading_controller.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/theme_controller.dart';
import 'home_view.dart';


class FirstOnboardingScreen extends StatefulWidget {
 const FirstOnboardingScreen({Key? key}) : super(key: key);
  @override
  State<FirstOnboardingScreen> createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  late ShakeDetector shakeDetector;
  final controller=OnboardingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location();
     shakeDetector=ShakeDetector.waitForStart(onPhoneShake: (){
       Navigator.pushReplacement(
       context, MaterialPageRoute(builder: (context) => const HomeView()));
    });
    
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    shakeDetector.stopListening();
    super.dispose();
  }
  
  void location() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('locations', "onBoarding");
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(controller: Provider.of<OnboardingController>(context,listen:false).pageController,itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                
                  SizedBox(height:300,child: PaddingOfOnboarding(controller: controller,index:index,widget:  AnimationWidget(controller: controller,index:index))),
                  PaddingOfOnboarding(controller: controller,index: index,widget:headlineText(index, context)),
                  PaddingOfOnboarding(controller: controller,index: index ,widget:descriptionText(index, context)),
                ]),
              );
              
            }, itemCount: controller.onboardingPages.length,onPageChanged: Provider.of<OnboardingController>(context).updatePage),
            LeftCornerWidget(controller: controller),
             RightCornerButtonWidget(shakeDetector: shakeDetector)
          ],
        ),
      ),
    );
  }

  Text descriptionText(int index, BuildContext context) => Text(controller.onboardingPages[index].description ,style:Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,);

  Text headlineText(int index, BuildContext context) => Text(controller.onboardingPages[index].title,style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center);

}

class LeftCornerWidget extends StatelessWidget {
  const LeftCornerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;
 
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom:20,
      left:20,
      child: Row(children:List.generate(controller.onboardingPages.length,
      ((index) => Container(
        margin: const EdgeInsets.all(5),
        width: 12,
        height: 12,
        decoration:  BoxDecoration(
          color: (index==context.read<OnboardingController>().currentPage)?Colors.red:Colors.grey,
          shape:BoxShape.circle
        ),
      )))),
    );
  }
}

class RightCornerButtonWidget extends StatelessWidget {
  const RightCornerButtonWidget({
    Key? key,required this.shakeDetector
  }) : super(key: key);
  final ShakeDetector shakeDetector;
  @override
  Widget build(BuildContext context) {
    return Positioned(bottom: 20,right:20,child: FloatingActionButton(

      onPressed: Provider.of<OnboardingController>(context).currentPage==2? () async {
      context.read<OnboardingController>().currentPage=0; 
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomeView()));
      
      }:(){
        Provider.of<OnboardingController>(context,listen:false).forward();
        shakeDetector.startListening();

      },
      elevation: 0,
      child: Provider.of<OnboardingController>(context).currentPage==2?const Text("Start"):const Text('Next'),
    ),);
  }
}

class AnimationWidget extends StatefulWidget {
   const AnimationWidget({
    Key? key,
    required this.controller, required this.index,
  }) : super(key: key);
  final int index;
  final OnboardingController controller;  

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isLight=false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration:const Duration(seconds: 2  ) );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell( onTap: widget.index.isOdd ?() async {
      Future.microtask(() async => 
           context.read<ChangeTheme>().changeTheme()

      );
      !context.read<ChangeTheme>().isLight ? _animationController.animateTo(0.5):_animationController.animateBack(0);
      final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('darkMode', context.read<ChangeTheme>().isLight);


  
    }:null,child: Lottie.asset(repeat: true,controller:widget.index.isOdd ? _animationController:null,widget.controller.onboardingPages[widget.index].animationAsset!));
  }
}

class PaddingOfOnboarding extends StatelessWidget {
  const PaddingOfOnboarding({
    Key? key,
    required this.controller, required this.index,required this.widget
  }) : super(key: key);
  final Widget widget;
  final OnboardingController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 32),child: widget);
  }
}
