import 'package:flutter/material.dart';
import 'package:messerger/buttom_items/message_screen.dart';
import 'package:messerger/widgets/button_and_Text.dart';
import 'package:toggle_switch/toggle_switch.dart';

enum MessageStatus { seen, unseen, delivered, sent }

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  List<Map<String, dynamic>> chats = [
    {
      "name": "Nur",
      "profile_pictiure":
          "https://th.bing.com/th/id/OIP.gHYfltewlh8hQERD9UF69AAAAA?pid=ImgDet&rs=1",
      "last_message": "hello",
      "online_stutes": "online",
      "unseen_messages": 2,
      "staus": MessageStatus.seen,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": true,
    },
    {
      "name": "abdul",
      "profile_pictiure":
          "https://thumbs.dreamstime.com/b/handsome-man-portrait-16109015.jpg",
      "last_message": "busy now",
      "online_stutes": "online",
      "unseen_messages": 3,
      "staus": MessageStatus.delivered,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": true,
    },
    {
      "name": "mazid",
      "profile_pictiure":
          "https://th.bing.com/th/id/R.0569fe35898c34726564915930c54c26?rik=LEvOfSwdzW13PA&pid=ImgRaw&r=0",
      "last_message": "ok i will try",
      "online_stutes": "offline",
      "unseen_messages": 3,
      "staus": MessageStatus.seen,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": true,
    },
    {
      "name": "sabbir",
      "profile_pictiure":
          "https://s-s.huffpost.com/contributors/pax-ahimsa-gethen/headshot.jpg",
      "last_message": "call me ",
      "online_stutes": "offline",
      "unseen_messages": 3,
      "staus": MessageStatus.delivered,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": false,
    },
    //
    {
      "name": "Nur",
      "profile_pictiure":
          "https://th.bing.com/th/id/OIP.gHYfltewlh8hQERD9UF69AAAAA?pid=ImgDet&rs=1",
      "last_message": "hello",
      "online_stutes": "online",
      "unseen_messages": 2,
      "staus": MessageStatus.seen,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": true,
    },
    {
      "name": "abdul",
      "profile_pictiure":
          "https://thumbs.dreamstime.com/b/handsome-man-portrait-16109015.jpg",
      "last_message": "busy now",
      "online_stutes": "online",
      "unseen_messages": 3,
      "staus": MessageStatus.delivered,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": true,
    },
    {
      "name": "mazid",
      "profile_pictiure":
          "https://th.bing.com/th/id/R.0569fe35898c34726564915930c54c26?rik=LEvOfSwdzW13PA&pid=ImgRaw&r=0",
      "last_message": "ok i will try",
      "online_stutes": "offline",
      "unseen_messages": 3,
      "staus": MessageStatus.seen,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": true,
    },
    {
      "name": "sabbir",
      "profile_pictiure":
          "https://s-s.huffpost.com/contributors/pax-ahimsa-gethen/headshot.jpg",
      "last_message": "call me ",
      "online_stutes": "offline",
      "unseen_messages": 3,
      "staus": MessageStatus.delivered,
      "last_Seen": DateTime(2022, 09, 03, 00, 00),
      "has_stroty": false,
    },
  ];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Boldtext("Calls", fontSize: 30)),
              //.. toggle
              ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.blue.shade300],
                  [Colors.blue.shade300]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white54,
                //inactiveFgColor: Colors.black26,
                initialLabelIndex: currentindex,
                totalSwitches: 2,
                labels: const ['All', 'Mised'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    currentindex = index!;
                  });
                },
              ),

              //.... list of All calls

              Container(
                margin: const EdgeInsets.only(top: 18.0, left: 19, right: 19),
                height: MediaQuery.of(context).size.height - 30,
                width: MediaQuery.of(context).size.width,
                child: currentindex == 0
                    ? const Text("all calls")
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: chats.length,
                        itemBuilder: ((context, index) => ChatBox(
                              name: chats[index]["name"],
                              profile_picture: chats[index]["profile_pictiure"],
                              has_stroty: chats[index]["has_stroty"],
                              last_seen: chats[index]["last_Seen"],
                              online_stutes: chats[index]["online_stutes"],
                              last_message: chats[index]["last_message"],
                              staus: chats[index]["staus"],
                              unseen_messages: chats[index]["unseen_messages"],
                            )),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
