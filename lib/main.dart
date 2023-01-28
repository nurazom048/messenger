// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:messerger/buttom_items/Account_screen.dart';
import 'package:messerger/buttom_items/call_screen.dart';
import 'package:messerger/buttom_items/message_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ButomNevBar(),
    );
  }
}

class ButomNevBar extends StatefulWidget {
  const ButomNevBar({super.key});

  @override
  State<ButomNevBar> createState() => _ButomNevBarState();
}

class _ButomNevBarState extends State<ButomNevBar> {
  List<Widget> pages = [CallScreen(), MessageScreen(), AccountScreen()];
  int currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: Row(
        children: [
          ButtomIcon(
            icon: const Icon(Icons.call),
            isactive: currentindex == 0,
            itemposition: "start",
            onTap: () {
              setState(() {
                currentindex = 0;
              });
            },
          ),
          ButtomIcon(
            icon: const Icon(Icons.chat_bubble_rounded),
            isactive: currentindex == 1,
            onTap: () {
              setState(() {
                currentindex = 1;
              });
            },
          ),
          ButtomIcon(
            itemposition: "end",
            icon: const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.YvOFZ6mkUoMVw0VlBS6tQwHaHa?pid=ImgDet&w=1080&h=1080&rs=1"),
            ),
            isactive: currentindex == 2,
            onTap: () {
              setState(() {
                currentindex = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ButtomIcon extends StatelessWidget {
  Widget icon;
  bool isactive;
  dynamic onTap;
  String? itemposition;
  ButtomIcon(
      {Key? key,
      this.itemposition,
      required this.icon,
      required this.isactive,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: itemposition == "start"
              ? const BorderRadius.only(topLeft: Radius.circular(27))
              : itemposition == "end"
                  ? const BorderRadius.only(topRight: Radius.circular(27))
                  : BorderRadius.zero,
        ),
        height: 70,
        width: size.width / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 5),
            icon,
            isactive
                ? Container(
                    height: 5,
                    width: 60,
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                  )
                : Container(height: 5, width: 60)
          ],
        ),
      ),
    );
  }
}
