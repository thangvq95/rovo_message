import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/assets.dart';

import '../../service_locator.dart';

class ItemPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Material(
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          getIt<AppProvider>().curTheme.primaryColor),
                    ),
                    width: 200.0,
                    height: 200.0,
                    padding: EdgeInsets.all(70.0),
                    decoration: BoxDecoration(
                      color: getIt<AppProvider>().curTheme.border,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) => Material(
                    child: Image.asset(
                      Assets.logo_text,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                  ),
              imageUrl: itemMessage.message.content.url,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            clipBehavior: Clip.hardEdge,
          ),
          margin: EdgeInsets.only(
              bottom: itemMessage.isLastMessageRight(itemMessage.index)
                  ? 20.0
                  : 10.0,
              right: 10.0),
        )
      ],
    );
  }
}
