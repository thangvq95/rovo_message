import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/data/message_repository.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/service_locator.dart';
import 'package:rovo_app/utils/date_util.dart';
import 'message_item_other.dart';
import 'message_item_photo.dart';
import 'message_item_system.dart';
import 'message_item_text.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    List<Message> list = getIt<MessageRepository>().messages();
    return Column(
      children: <Widget>[
        /// Check Date
        if ((list.length - 1 == itemMessage.index)  ||
            DateUtil.differenceDay(itemMessage.message.createdAt, list[itemMessage.index + 1].createdAt))
          itemDay(itemMessage),
        itemWidget(itemMessage),
      ],
    );
  }

  Widget itemWidget(ItemMessage itemMessage) {
    if (itemMessage.message.type == MessageType.SYSTEM) {
      return ItemSystem();

      /// System
    } else {
      if (itemMessage.message.sender != null &&
          itemMessage.message.senderId == Configure.currentUserId) {
        /// Current User - Right
        if (itemMessage.message.type == MessageType.PHOTO)
          return ItemPhoto();

        /// Photo
        else
          return ItemText();

        /// Text
      } else {
        /// Message from others user - Left
        return ItemOthers();
      }
    }
  }
  Widget itemDay(ItemMessage itemMessage){
    return Container(
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        DateUtil.dateFormat(itemMessage.message.createdAt),
        style: AppStyles.textStyleItem(),
      ),
    );
  }



}
