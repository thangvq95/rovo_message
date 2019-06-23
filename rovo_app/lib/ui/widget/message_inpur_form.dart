import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/constant/constant.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/content.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/model/user.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:path/path.dart' as path;
import '../../app_icons.dart';
import '../../service_locator.dart';
import 'package:image_picker/image_picker.dart';

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
                    color: getIt<AppProvider>().curTheme.background,
                    child: new IconButton(
                      icon: new Icon(AppIcons.camera),
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
            color: getIt<AppProvider>().curTheme.background,
            margin: new EdgeInsets.symmetric(horizontal: 8.0),
            child: new IconButton(
              icon: new Icon(AppIcons.send),
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

  /// Just for demo
  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if(image!=null){
      Message message = new Message(
        id: getIt<MessageRepository>().messages()[0].id + 1,
        groupId: getIt<MessageRepository>().messages()[0].groupId,
        type: MessageType.PHOTO,
        position: getIt<MessageRepository>().messages()[0].position + 1,
        content: Content(url:image.path, text: "📷 Photo", subType: Constant.FROM_DEVICE),
        createdAt: DateTime.now(),
        updateAt: DateTime.now(),
        senderId: Configure.currentUserId,
        sender: User(firstName: 'James'),
      );
      getIt<MessageRepository>().messages().insert(0, message);
      //TODO: change state
      getIt<AppProvider>().notifyListeners();
    }
  }

  /// Just for demo
  onSendMessage(String text) {
    Message message = new Message(
      id: getIt<MessageRepository>().messages()[0].id + 1,
      groupId: getIt<MessageRepository>().messages()[0].groupId,
      type: MessageType.TEXT,
      position: getIt<MessageRepository>().messages()[0].position + 1,
      content: Content(text: text),
      createdAt: DateTime.now(),
      updateAt: DateTime.now(),
      senderId: Configure.currentUserId,
      sender: User(firstName: 'James'),
    );
    getIt<MessageRepository>().messages().insert(0, message);
    //TODO: change state
    getIt<AppProvider>().notifyListeners();
  }
}
