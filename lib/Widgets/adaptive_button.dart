import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  AdaptiveButton({this.title, this.submitData});
  final String title;
  final Function submitData;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            width: MediaQuery.of(context).size.width * 0.55,
            child: CupertinoButton(
              child: FittedBox(child: Text(title)),
              onPressed: submitData,
              color: Colors.purple,
            ),
          )
        : RaisedButton(
            child: Text(title),
            color: Colors.purple,
            textColor: Colors.white,
            onPressed: submitData,
          );
  }
}
