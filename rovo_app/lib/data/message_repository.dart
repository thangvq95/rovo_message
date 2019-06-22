
import 'package:rovo_app/model/message.dart';

abstract class MessageRepository{

  Future<List<Message>> getMessage();

  List<Message> messages();
}

