import 'package:flutter/material.dart';

class Boldtext extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;

  Boldtext(
    this.text, {
    this.color,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 20,
          fontWeight: FontWeight.bold),
    );
  }
}
