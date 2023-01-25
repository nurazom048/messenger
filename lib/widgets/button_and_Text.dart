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

class MyCircularButton extends StatelessWidget {
  IconData icon;
  MyCircularButton({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blue,
      child: Icon(icon),
    );
  }
}
