// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messerger/buttom_items/call_screen.dart';
import 'package:messerger/buttom_items/message_screen.dart';
import 'package:messerger/widgets/buttons_and_text.dart/button_and_Text.dart';
import 'package:messerger/widgets/widgets.dart';

// ignore: must_be_immutable
class ChatBox extends StatelessWidget {
  String name, last_message, online_stutes, profile_picture;
  bool has_stroty;
  dynamic onTap;
  MessageStatus staus;
  DateTime last_seen;
  int unseen_messages;

  ChatBox({
    super.key,
    required this.name,
    required this.last_message,
    required this.has_stroty,
    required this.online_stutes,
    required this.last_seen,
    required this.staus,
    required this.unseen_messages,
    required this.profile_picture,
    //
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 3, right: 4),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
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
                    Text(last_message),
                    Text(staus.runtimeType.toString()),
                  ],
                ),
                const Spacer(flex: 20),
                // ... unseen messages and date time
                Column(
                  children: [
                    staus.name == "delivered"
                        ? const Icon(Icons.check)
                        : CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.red.shade100,
                            child: Boldtext(unseen_messages.toString())),
                    const SizedBox(height: 4),
                    Text(DateFormat.yMMMEd().format(last_seen))
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          MyDivider()
        ],
      ),
    );
  }
}
