// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messerger/buttom_items/call_screen.dart';
import 'package:messerger/buttom_items/message_screen.dart';
import 'package:messerger/widgets/buttons_and_text.dart/button_and_Text.dart';
import 'package:messerger/widgets/widgets.dart';

// ignore: must_be_immutable
class CallBox extends StatelessWidget {
  String name, online_stutes, profile_picture;
  bool has_stroty;

  CallStatus callstaus;
  Calltype calltype;
  dynamic last_call_duration;
  DateTime call_time;

  CallBox({
    super.key,
    required this.name,
    required this.profile_picture,
    required this.online_stutes,
    required this.has_stroty,
    required this.call_time,
    required this.last_call_duration,
    required this.callstaus,
    required this.calltype,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 3, right: 4),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(flex: 2),
              //...
              ImageAvater(
                  profilepicture: profile_picture,
                  online_stutes: online_stutes,
                  has_story: has_stroty),
              //... name and last message
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Boldtext(name),
                  Row(
                    children: [
                      Icon(
                          calltype.name == "video"
                              ? Icons.videocam
                              : Icons.call,
                          size: 17),
                      Text(
                          " ${callstaus.name == "Recived_call" ? last_call_duration : callstaus.name}"),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 20),
              // ... last call time and icon
              Column(
                children: [
                  callstaus.name == "Missed_call"
                      ? const Icon(
                          Icons.phone_callback_sharp,
                          color: Colors.red,
                        )
                      : callstaus.name == "Recived_call"
                          ? const Icon(
                              Icons.phone_callback_sharp,
                              color: Colors.blue,
                            )
                          : callstaus.name == "Dial_call"
                              ? const Icon(
                                  Icons.call_outlined,
                                  color: Colors.green,
                                )
                              : Container(),

                  const SizedBox(height: 4),
                  Text(DateFormat.MMMEd().format(call_time)) // last call time
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
          MyDivider()
        ],
      ),
    );
  }
}
