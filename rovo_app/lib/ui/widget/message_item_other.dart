import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rovo_app/model/custom/item_message.dart';
import 'package:rovo_app/model/message.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/assets.dart';
import 'package:rovo_app/resouces/styles.dart';

import '../../service_locator.dart';

class ItemOthers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemMessage itemMessage = Provider.of<ItemMessage>(context);
    double maxWidth = MediaQuery.of(context).size.width * 4 / 5;

    return Container(
      child: Row(
        children: <Widget>[
          /// picture user TODO: move picture to first message
          itemMessage.isDifferentUser(itemMessage.index)
              ? Material(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                getIt<AppProvider>().curTheme.cardColor),
                          ),
                          width: 35.0,
                          height: 35.0,
                          padding: EdgeInsets.all(10.0),
                        ),
                    imageUrl: itemMessage.message.sender.picture,
                    width: 35.0,
                    height: 35.0,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                )
              : Container(width: 35.0),

          itemMessage.message.type == MessageType.TEXT
              ? Flexible(
                  child: Container(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if(itemMessage.isDifferentUser(itemMessage.index))
                          Text(
                            itemMessage.message.sender.firstName,
                            style: AppStyles.textStyleSubItem(),
                          ),
                        Text(
                          itemMessage.message.content.text,
                          style: AppStyles.textStyleItem(),
                        ),
                      ],
                    ),

                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        color: getIt<AppProvider>().curTheme.background,
                        borderRadius: BorderRadius.circular(8.0)),
                    constraints: new BoxConstraints(maxWidth: maxWidth),
                    margin: EdgeInsets.only(
                      //bottom: 10.0,
                        bottom: itemMessage.isNewMemberMessage(itemMessage.index)
                            ? 10.0
                            : 5.0,
                        left: 10.0),
                  ),
                )
              : itemMessage.message.type == MessageType.PHOTO
                  ? Container(
                      child: Material(
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      getIt<AppProvider>()
                                          .curTheme
                                          .cardColor),
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
                      margin: EdgeInsets.only(left: 10.0),
                    )
                  : Container(
                      child: Text(''),
                    ),
        ],
      ),
    );
  }
}
