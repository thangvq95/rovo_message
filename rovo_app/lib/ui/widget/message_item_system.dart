import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/resouces/styles.dart';

class ItemSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      alignment: Alignment(0, 0),
      child: Text(
        itemMessage.message.content.text,
        style: AppStyles.textStyleSubItem(),
      ),
    );
  }
}
