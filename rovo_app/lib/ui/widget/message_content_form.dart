import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/service_locator.dart';

import 'message_item.dart';

class ContentForm extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getIt<AppProvider>().curTheme.background,
        child: StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
//        if(snapshot.hasError){
//          return Center(
//              child: Text('Opps! Something went wrong!', style: AppStyles.textStyleItem(),));
//        } else if (!snapshot.hasData) {
//          return Center(
//              child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(
//                      getIt<AppProvider>().curTheme.accentColor)));
//        } else {
//          return ListView.builder(
//            padding: EdgeInsets.all(10.0),
//            itemBuilder: (context, index) =>
//                buildItem(index, getIt<MessageRepository>().messages()[index]),
////            itemCount: snapshot.data.documents.length,
//            itemCount: getIt<MessageRepository>().messages().length,
//            reverse: true,
//            controller: listScrollController,
//          );
//        }
        if(getIt<MessageRepository>().messages().length > 0){
          return ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) =>
              Provider.value(value: new ItemMessage(getIt<MessageRepository>().messages()[index], index),
                child: Item(),
              ),
            itemCount: getIt<MessageRepository>().messages().length,
            reverse: true,
            controller: listScrollController,
          );
        }else
          return Container();
      },
    ));
  }
}


