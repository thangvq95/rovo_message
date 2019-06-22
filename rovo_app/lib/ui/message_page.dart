import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Text('Tennis buddies', style: AppStyles.textStyleItemHeader(),),
            ),
            Divider(height: 2, color: getIt<AppProvider>().curTheme.border,),
            Flexible(
              child: StreamProvider.controller(
                builder: (_) => StreamController<List<Message>>(),
                initialData: getIt<MessageRepository>().messages(),
                child: ContentForm(),),
            ),
            Divider(height: 2, color: getIt<AppProvider>().curTheme.border,),
            InputForm()
          ],
        ),
      ),
    );
  }
}
