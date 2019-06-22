import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/model/message.dart';
import 'message_item_other.dart';
import 'message_item_photo.dart';
import 'message_item_system.dart';
import 'message_item_text.dart';

class Item extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    MessageType messageType = getMessageType(itemMessage.message.type);
    if(messageType == MessageType.SYSTEM){
      return ItemSystem(); /// System
    }else{
      if (itemMessage.message.sender!=null && itemMessage.message.senderId == Configure.currentUserId) {
        /// Current User - Right
        if(messageType == MessageType.PHOTO)
          return ItemPhoto(); /// Photo
        else
          return ItemText(); /// Text
      } else {
        /// Message from others user - Left
        return ItemOthers();
      }
    }
  }

}