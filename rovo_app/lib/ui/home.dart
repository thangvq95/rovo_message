import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/configs/routes.dart';
import 'package:rovo_app/custom/button.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/assets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Provider.of<AppProvider>(context).curTheme.background,
      padding: EdgeInsets.only(top: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(Assets.logo_text, width: 200, fit: BoxFit.fitWidth,),
          Container(
            width: width * 2 / 3,
            height: height/5,
            margin: EdgeInsets.only(bottom: 20, top: 20),
            child: PrimaryButton("Demo 1", onPressed: () {
              Navigator.pushNamed(context, Navigation.MessagePage);
            }),
          ),
          Container(
            width: width * 2 / 3,
            height: height/5,
            margin: EdgeInsets.only(top: 20),
            child: PrimaryButton("Demo 2", onPressed: () {
              Navigator.pushNamed(context, Navigation.AlgorithmPage);
            }),
          ),
        ],
      ),
    );
  }
}
