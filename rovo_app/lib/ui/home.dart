import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/provider/app_provider.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<AppProvider>(context).curTheme.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}