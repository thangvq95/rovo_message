import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/utils/network_util.dart';

import '../service_locator.dart';

class MessageProvider extends MessageRepository{

  List<Message> _messages = [];

  @override
  List<Message> messages() => _messages;

  @override
  Future<List<Message>> getMessage(){
    return parseJson(Configure.MESSAGE_URL).then((dynamic res){
      if(res[Configure.ERROR_PATH] != null && res[Configure.ERROR_PATH]) throw new Exception(res[Configure.ERROR_MESSAGE_PATH]);
      List<Message> list = [];
      if (res[Configure.MESSAGE_PATH] != null) {
        res[Configure.MESSAGE_PATH].forEach((message) {
          list.add(new Message.fromJson(message));
        });
      }
      this._messages = list;
      return list;
    });
  }

  Future<dynamic> parseJson(String url) async {
    return await getIt<NetworkUtil>().get(url);
  }


}