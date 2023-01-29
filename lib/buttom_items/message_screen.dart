// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:messerger/buttom_items/call_screen.dart';
import 'package:messerger/buttom_items/chats_detalis.dart/Chat_Details.dart';
import 'package:messerger/widgets/buttons_and_text.dart/button_and_Text.dart';
import 'package:messerger/widgets/chat_box.dart';
import 'package:messerger/widgets/widgets.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //..... to story section
            Container(
              margin: const EdgeInsets.only(top: 8.0, bottom: 13.0, left: 35),
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //... only show acctive acccount
                  itemCount: chats
                      .where((item) => item["online_stutes"] == "online")
                      .length,
                  itemBuilder: (context, index) {
                    final onlineChat = chats
                        .where((item) => item["online_stutes"] == "online")
                        .toList()[index];
                    return ImageAvater(
                      profilepicture: onlineChat["profile_pictiure"],
                      has_story: onlineChat["has_stroty"],
                      online_stutes: onlineChat["online_stutes"],
                    );
                  }),
            ),
            //.... add message section
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                children: [
                  const Spacer(flex: 2),
                  Boldtext("Message"),
                  Boldtext(" 48 New ", color: Colors.blue),
                  const Spacer(flex: 70),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 23.0),
              child: Column(
                children: [
                  //... searchbar
                  SearchBar(),
//....chatbox...
                  Container(
                    height: MediaQuery.of(context).size.height - 30,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
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

                            //
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatDetails(
                                        profile_pictiure: chats[index]
                                            ["profile_pictiure"],
                                        name: chats[index]["name"],
                                        online_stutes: chats[index]
                                            ["online_stutes"],
                                      )),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//..

class ImageAvater extends StatelessWidget {
  String profilepicture, online_stutes;
  bool has_story;
  ImageAvater({
    required this.profilepicture,
    required this.online_stutes,
    required this.has_story,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          height: 76,
          width: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red,
                  Colors.red,
                  Colors.red,
                  Colors.red,
                  Colors.black45,
                  Colors.pink,
                  Colors.pink,
                  Colors.pink,
                  Colors.pink
                ]),
            //...
            border: Border.all(
                width: has_story == true ? 2 : 0,
                color: Colors.white.withOpacity(0.5)),
          ),
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: 34.5, backgroundImage: NetworkImage(profilepicture)),
          ),
        ),
        online_stutes == "online"
            ? const Positioned(
                bottom: 14,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 7,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.blue,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
