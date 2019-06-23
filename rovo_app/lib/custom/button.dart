import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/service_locator.dart';

class PrimaryButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final TextStyle style;
  final Color color;

  PrimaryButton(this.text, {this.onPressed, this.style, this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text, style: style ?? AppStyles.textStyleItemHeader(),),
      color: color ?? getIt<AppProvider>().curTheme.cardBackground,
      onPressed: onPressed,
    );
  }
}