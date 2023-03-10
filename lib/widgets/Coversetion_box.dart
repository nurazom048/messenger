// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'enum .dart';

class ConversetionBox extends StatelessWidget {
  String? name;
  DateTime time, previusTime, last, beforeLast;
  message_type? messagetype;
  dynamic message;
  String image;

  bool isMe;
  bool islast;

  ConversetionBox({
    this.name,
    required this.image,
    required this.time,
    required this.messagetype,
    required this.message,
    required this.isMe,
    required this.previusTime,
    required this.beforeLast,
    required this.last,
    required this.islast,
    Key? key,
  }) : super(key: key);

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(topTime(previusTime, time, DateTime.now())),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Column(
              children: [
                image != "null"
                    ? Container(
                        height: 200, width: 200, //color: Colors.red
                        child: Image.file(
                          File(image),
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(),
                message != "null"
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(message)))
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                Text(endTime(previusTime, last)), // end time
              ],
            ),
          ],
        ),
      ],
    );
  }

//..... end time....//
  String endTime(DateTime previusTime, DateTime last) {
    // time match with previus and is last
    if (time.difference(previusTime).inMinutes == 0 &&
        time.difference(previusTime).inHours == 0 &&
        islast) {
      return DateFormat.jm().format(time);
    } else if (last.difference(previusTime).inMinutes != 0 &&
        last.difference(previusTime).inHours != 0 && //
        islast == true) {
      return DateFormat.jm().format(time);
    } else {
      return "";
    }
  }

  //
  String topTime(DateTime previusTime, DateTime time, DateTime now) {
    if (previusTime.difference(time).inHours == 0 &&
        previusTime.difference(time).inMinutes == 0) {
      return " ";
    } else if (now.difference(time).inDays == 0) {
      return "${DateFormat.jm().format(time)} today";
    } else {
      return DateFormat.jm().format(time);
    }
  }
}
