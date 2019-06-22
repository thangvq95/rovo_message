import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';

import '../../service_locator.dart';

class InputForm extends StatelessWidget {
  final FocusNode focusNode = new FocusNode();
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
      child: Row(
        children: <Widget>[
          // Input form message
          Flexible(
            child: Container(
              decoration: new BoxDecoration(
                  border: new Border.all(
                      color: getIt<AppProvider>().curTheme.border),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: <Widget>[
                  new Container(
                    color: Colors.white,
                    child: new IconButton(
                      icon: new Icon(Icons.camera_alt),
                      onPressed: getImage,
                      color: getIt<AppProvider>().curTheme.primaryColor,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(top: 2, bottom: 2),
                      child: TextField(
                        style: AppStyles.textStyleItemInputMessage(),
                        controller: textEditingController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type your message...',
                          hintStyle: TextStyle(
                              color: getIt<AppProvider>().curTheme.hint),
                        ),
                        focusNode: focusNode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button send message
          new Container(
            color: Colors.white,
            margin: new EdgeInsets.symmetric(horizontal: 8.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => onSendMessage(textEditingController.text),
              color: getIt<AppProvider>().curTheme.primaryColor,
            ),
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
    );
  }

  void getImage() {}

  onSendMessage(String text) {}
}
