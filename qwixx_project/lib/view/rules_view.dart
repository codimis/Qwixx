import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../languages/en-Eng.dart';


class RulesView extends StatelessWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("Rules"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(Texts.title,style: Theme.of(context).textTheme.headline3,),
            const inlinePadding(),
            Text(Texts.rulesText1,style: Theme.of(context).textTheme.bodyText1),
            const inlinePadding(),
            SizedBox(height:150,width:MediaQuery.of(context).size.width,child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              Image.asset("assets/image/rule1.jpg"),
              Image.asset("assets/image/rule2.jpg")
          ])),
          const inlinePadding(),
          Text(Texts.title2,style: Theme.of(context).textTheme.headline6,),
          const inlinePadding(),
          Text(Texts.rulesText2,style: Theme.of(context).textTheme.bodyText1),
          const inlinePadding(),
          SizedBox(height:150,width:MediaQuery.of(context).size.width,child: Image.asset("assets/image/rules3.jpg"),
          ),
           Text(Texts.title3,style: Theme.of(context).textTheme.headline6,),
          const inlinePadding(),
          Text(Texts.rulesText3,style: Theme.of(context).textTheme.bodyText1),
          const inlinePadding(),
          Text(Texts.title4,style: Theme.of(context).textTheme.headline6,),
          const inlinePadding(),
          Text(Texts.rulesText4,style: Theme.of(context).textTheme.bodyText1),
          const inlinePadding(),
          SizedBox(height:150,width:MediaQuery.of(context).size.width,child: Image.asset("assets/image/rules4.jpg"),
          ),
          const inlinePadding(),
          Text(Texts.title5,style: Theme.of(context).textTheme.headline6,),
          const inlinePadding(),
          Text(Texts.rulesText5,style: Theme.of(context).textTheme.bodyText1),
          const inlinePadding(),
          Text(Texts.title6,style: Theme.of(context).textTheme.headline6,),
          const inlinePadding(),
          Text(Texts.rulesText6,style: Theme.of(context).textTheme.bodyText1),
          const inlinePadding(),
          ]))
    
    );
  }
}

class inlinePadding extends StatelessWidget {
  const inlinePadding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height:20);
  }
}