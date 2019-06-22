import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';

import '../../service_locator.dart';

class ItemText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    double maxWidth = MediaQuery.of(context).size.width * 4 / 5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Container(
            child: Text(
              itemMessage.message.content.text.toString(),
              style: AppStyles.textStyleItemAccent(),
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            decoration: BoxDecoration(
                color: getIt<AppProvider>().curTheme.primaryColor,
                borderRadius: BorderRadius.circular(8.0),
            ),
            constraints: new BoxConstraints(
                maxWidth: maxWidth),
            margin: EdgeInsets.only(
               // bottom: 10.0,
                bottom: itemMessage.isLastMessageRight(itemMessage.index)
                    ? 10.0
                    : 5.0,
                right: 10.0),
          ),
        )
      ],
    );
  }
}
