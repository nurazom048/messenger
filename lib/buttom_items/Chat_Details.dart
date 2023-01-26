// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messerger/buttom_items/Chat_Details.dart';
import 'package:messerger/widgets/button_and_Text.dart';
import 'package:messerger/widgets/widgets.dart';

enum message_type { text, image, video, audio, file }

class ChatDetails extends StatefulWidget {
  String profile_pictiure, name, online_stutes;
  ChatDetails({
    super.key,
    required this.profile_pictiure,
    required this.name,
    required this.online_stutes,
  }) {}

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  //
  List<Map<String, dynamic>> conversetion = [
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": false,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": null,
      "video": null,
      "audio": null,
      "file": null,
    },
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": false,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": null,
      "video": null,
      "audio": null,
      "file": null,
    },
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 11, 40),

      "is_me": true,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": null,
      "video": null,
      "audio": null,
      "file": null,
    },
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": true,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": null,
      "video": null,
      "audio": null,
      "file": null,
    },
    {
      "name": "DF",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": false,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": null,
      "video": null,
      "audio": null,
      "file": null,
    },
  ];

  //
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          //!!....Appbar......
          AppbarCustom(
              profile_pictiure: widget.profile_pictiure,
              title: widget.name,
              subtitle: widget.online_stutes),

          ///..... body
          Expanded(
            child: ListView.builder(
                reverse: false,
                scrollDirection: Axis.vertical,
                //... only show acctive acccount
                itemCount: conversetion.length,
                itemBuilder: (context, index) {
                  return ConversetionBox(
                    message: conversetion[index]["Message"],
                    messagetype: conversetion[index]["message_type"],
                    time: conversetion[index]["time"],
                    is_me: conversetion[index]["is_me"],
                    previus_time: conversetion[index == 0 ? 0 : index - 1]
                        ["time"],
                  );
                }),
          ),

          //!!...... Send Message section .....
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12)),
            child: Row(
              children: [
                const Icon(Icons.attach_file, color: Colors.black45),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      hintText: "send message",
                      suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 9.0),
                          child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              print("object");

                              //
                              Map<String, dynamic> newMessage = {
                                "name": "nur",
                                "Message": _controller.text,
                                "is_me": true,
                                "time": DateTime.now(),
                              };
                              setState(() {
                                conversetion.add(newMessage);
                              });
                            },
                          )),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConversetionBox extends StatelessWidget {
  String? name;
  DateTime time, previus_time;
  message_type? messagetype;
  String message;
  bool is_me;

  ConversetionBox({
    this.name,
    required this.time,
    required this.messagetype,
    required this.message,
    required this.is_me,
    required this.previus_time,
    Key? key,
  }) : super(key: key);

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String timeString = "";

    //
    if (previus_time.difference(time).inHours == 0 &&
        previus_time.difference(time).inMinutes == 0) {
      timeString = " ${DateFormat.Hm().format(time)} ";
    } else if (now.difference(time).inDays == 0) {
      timeString = " ${DateFormat.Hm().format(time)} today";
    }
    return Column(
      children: [
        /// time
        Text(previus_time.difference(time).inHours == 0 &&
                previus_time.difference(time).inMinutes == 0
            ? ""
            : " $timeString "),

        //
        Row(
          mainAxisAlignment:
              is_me ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(message),
                  ),
                ),

                Text(previus_time.difference(time).inHours == 0 &&
                        previus_time.difference(time).inMinutes == 0
                    ? " "
                    : DateFormat.Hm().format(time)),

                // // date compear
                // Text(now.difference(time).inDays == 0 ? "Todaay" : ""),

                // Text(previus_time.difference(time).inMinutes == 0
                //     ? "match with previus time"
                //     : ""),

                // ///... minute and hour
                // Text(previus_time.difference(time).inHours == 0 &&
                //         previus_time.difference(time).inMinutes == 0
                //     ? "minute and hour match with previus"
                //     : ""),
                //
              ],
            ),
          ],
        ),
      ],
    );
  }
}
