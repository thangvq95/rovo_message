import 'package:flutter/material.dart';
import 'package:rovo_app/provider/app_provider.dart';
import 'package:rovo_app/resouces/styles.dart';
import 'package:rovo_app/service_locator.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    this.hintText,
    this.style,
    this.onSaved,
    this.controller,
    this.focusNode,
    this.onSubmitted,
    this.keyboardType,
    this.validator,
    this.maxLines,

  }) : super(key: key);

  final String hintText;
  final TextStyle style;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onSubmitted;
  final TextInputType keyboardType;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      style: style ?? AppStyles.textStyleItem(),
      decoration: new InputDecoration(
        hintText: hintText,
        hintStyle:  AppStyles.textStyleSubItem(),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 10.0),
        border: new OutlineInputBorder(
            borderSide: BorderSide(color: getIt<AppProvider>().curTheme.border),
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
      ),
      onSaved: onSaved,
      controller: controller ?? null,
      focusNode: focusNode ?? null,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      maxLines: maxLines ?? 1,
    );
  }
}
