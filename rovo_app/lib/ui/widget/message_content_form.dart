import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/bloc/chat_bloc.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/service_locator.dart';
import 'message_item.dart';

class ContentForm extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    ChatBloc bloc = Provider.of<ChatBloc>(context);
    return Container(
      color: getIt<AppProvider>().curTheme.cardBackground,
        child: StreamBuilder(
      stream: bloc.getMessages,
      builder: (context, AsyncSnapshot<List<Message>> snapshot) {
        if(snapshot.hasError){
          return Center(
              child: Text('Opps! Something went wrong!', style: AppStyles.textStyleItem(),));
        } else if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      getIt<AppProvider>().curTheme.primaryColor)));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) =>
                Provider.value(value: new ItemMessage(snapshot.data[index], index),
                  child: Item(),
                ),
            itemCount: snapshot.data.length,
            reverse: true,
            controller: listScrollController,
          );
        }
      },
    ));
  }
}


