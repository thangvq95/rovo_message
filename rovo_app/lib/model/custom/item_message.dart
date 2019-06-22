import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/data/message_repository.dart';

import '../../service_locator.dart';
import '../message.dart';

class ItemMessage{
  Message message;
  int index;
  ItemMessage(this.message, this.index);

  bool isLastMessageLeft(int index) {
    if ((index > 0 && getIt<MessageRepository>().messages() != null && getIt<MessageRepository>().messages()[index - 1].senderId == Configure.currentUserId) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 && getIt<MessageRepository>().messages() != null && getIt<MessageRepository>().messages()[index - 1].senderId != Configure.currentUserId) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isDifferentUser(int index) {
    if (getIt<MessageRepository>().messages().length - 1 == index ||
    (index > 0 && getIt<MessageRepository>().messages() != null && getIt<MessageRepository>().messages()[index + 1].senderId != getIt<MessageRepository>().messages()[index].senderId) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isFirstMessageRight(int index) {
//    if ((index > 0 && getIt<MessageRepository>().messages() != null && getIt<MessageRepository>().messages()[index - 1].senderId != Configure.currentUserId) || index == 0) {
//      return true;
//    } else {
//      return false;
//    }
  }
}