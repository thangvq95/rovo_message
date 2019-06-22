
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/model/custom/item_message.dart';

class ItemSystem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    return Container(child: Text(''),);
  }

}