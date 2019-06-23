import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/constant/constant.dart';
import 'package:rovo_app/data/message_repository.dart';
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
            child: itemMessage.message.content.subType.toString() ==
                    Constant.FROM_DEVICE
                ? Container(
                    decoration: BoxDecoration(
                      color: getIt<AppProvider>().curTheme.border,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Image.file(
                      File(
                        itemMessage.message.content.url,
                      ),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ))
                : CachedNetworkImage(
                    placeholder: (context, url) => Container(
                          padding: EdgeInsets.all(50),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                getIt<AppProvider>().curTheme.primaryColor),
                          ),
                          decoration: BoxDecoration(
                            color: getIt<AppProvider>().curTheme.border,
                          ),
                        ),
                    errorWidget: (context, url, error) {
                      return Material(
                        child: Image.asset(
                          Assets.logo_text,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        clipBehavior: Clip.hardEdge,
                      );
                    },
                    imageUrl: itemMessage.message.content.url,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            clipBehavior: Clip.hardEdge,
          ),
          width: 200.0,
          height: 200.0,
          margin: EdgeInsets.only(
              bottom: itemMessage.isLastMessageRight(itemMessage.index)
                  ? 10.0
                  : 5.0,
              right: 10.0),
        )
      ],
    );
  }
}
