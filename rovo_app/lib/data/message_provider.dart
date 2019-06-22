import 'dart:convert';

import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/utils/network_util.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../service_locator.dart';

class MessageProvider extends MessageRepository{

  List<Message> _messages = [];

  @override
  List<Message> messages() => _messages;

  @override
  Future<List<Message>> getMessage(){
    return parseJson().then((dynamic res){
      if(res[Configure.ERROR_PATH] != null && res[Configure.ERROR_PATH]) throw new Exception(res[Configure.ERROR_MESSAGE_PATH]);
      List<Message> list = [];
      if (res[Configure.MESSAGE_PATH] != null) {
        res[Configure.MESSAGE_PATH].forEach((message) {
          list.add(new Message.fromJson(message));
        });
      }
      this._messages.clear();
      this._messages.addAll(list);
      return list;
    });
  }

  Future<dynamic> parseJson() async {
    /// parse from network
//    return await getIt<NetworkUtil>().get(Configure.MESSAGE_URL);
    /// parse from file
    return await loadAsset(Configure.CHAT_JSON).then((response){
      print(response.toString());
      return json.decode(response.toString());
    });
  }

  Future<String> loadAsset(String url) async {
    return await rootBundle.loadString(url);
  }

}