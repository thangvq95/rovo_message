import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class ChatBloc {
  List<Message> messages = [];
  final messageController = BehaviorSubject<List<Message>>();
  Observable<List<Message>> get getMessages => messageController.stream;

  ChatBloc(){
    messages = getIt<MessageRepository>().messages();
    messageController.value = messages;
  }
  void addMessage(Message message){
    messages.insert(0, message);
    messageController.sink.add(messages);
  }

  void dispose() {
    // close our StreamController to avoid memory leak
    messageController.close();
  }

}

