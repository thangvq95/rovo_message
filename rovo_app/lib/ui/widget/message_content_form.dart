import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/service_locator.dart';

class ContentForm extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getIt<AppProvider>().curTheme.background,
        child: StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(
              child: Text('Opps! Something went wrong!', style: AppStyles.textStyleItem(),));
        } else if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      getIt<AppProvider>().curTheme.accentColor)));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) =>
                buildItem(index, getIt<MessageRepository>().messages()[index]),
            itemCount: snapshot.data.documents.length,
            reverse: true,
            controller: listScrollController,
          );
        }
      },
    ));
  }

  Widget buildItem(int index, Message message) {
    return Container();
  }
}
