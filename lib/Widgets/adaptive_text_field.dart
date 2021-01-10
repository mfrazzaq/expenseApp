import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveTextField extends StatelessWidget {
  AdaptiveTextField(
      {@required this.placeholderEditingText,
      @required this.controllerEditingText,
      @required this.textInputType});
  final String placeholderEditingText;
  final TextEditingController controllerEditingText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: placeholderEditingText,
            controller: controllerEditingText,
            keyboardType: TextInputType.number,
          )
        : TextField(
            keyboardType: textInputType,
            decoration: InputDecoration(labelText: placeholderEditingText),
            controller: controllerEditingText,
          );
  }
}
