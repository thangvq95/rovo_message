import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/app_icons.dart';
import 'package:rovo_app/configs/themes.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/service_locator.dart';
import 'package:rovo_app/ui/widget/message_content_form.dart';
import 'package:rovo_app/ui/widget/message_inpur_form.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StateMessagePage();
}

class _StateMessagePage extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Provider.of<AppProvider>(context).curTheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child:  Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text('Tennis buddies', style: AppStyles.textStyleItemHeader(),),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: Icon(AppIcons.moon),
                      color: getIt<AppProvider>().curTheme.text,
                      onPressed: (){
                        getIt<AppProvider>().switchTheme();
                      },
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_backspace),
                      color: getIt<AppProvider>().curTheme.text,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 1, color: getIt<AppProvider>().curTheme.border,),
            Flexible(
              child: StreamProvider.controller(
                builder: (_) => StreamController<List<Message>>(),
                initialData: getIt<MessageRepository>().messages(),
                child: ContentForm(),),
            ),
            Divider(height: 1, color: getIt<AppProvider>().curTheme.border,),
            InputForm()
          ],
        ),
      ),
    );
  }
}
