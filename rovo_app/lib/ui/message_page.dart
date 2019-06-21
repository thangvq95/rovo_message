
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/provider/app_provider.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StateMessagePage();
}

class _StateMessagePage extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<AppProvider>(context).curTheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        ],
      ),
    );
  }
}