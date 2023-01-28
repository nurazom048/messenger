// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:messerger/widgets/buttons_and_text.dart/button_and_Text.dart';
import 'package:messerger/widgets/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          // .... Edit profile container
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                const ProfilePiccure(), //...profile picture
                Positioned(
                  left: 20,
                  bottom: 40,
                  child: Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AccountOptions(
                          prefixicon: Icons.person,
                          title: "Mohammad Imran",
                          subtitle: "@imran123",
                          sufixicon: false,
                        ),
                        MyDivider(thickness: 2),
                        AccountOptions(
                          prefixicon: Icons.alternate_email,
                          title: "Mohammad Imran",
                          subtitle: "@imran123",
                          sufixicon: false,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 45,
                    bottom: 98,
                    child: MyCircularButton(icon: Icons.edit)),
              ],
            ),
          ),
          const Spacer(),

          //!!.... Account Screen options
          AccountOptions(
            prefix: StoryIcon(),
            text: const Text("NewStory"),
          ),
          AccountOptions(
            prefixicon: Icons.spatial_audio_off_rounded,
            text: const Text("NewChanels"),
          ),
          AccountOptions(
            prefixicon: Icons.people,
            text: const Text("NewGroup"),
          ),
          AccountOptions(
            prefixicon: Icons.filter_5_rounded,
            text: const Text("Storages"),
            sufix: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "89 GB",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(
                      text: "/150 GB  ",
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ),
          AccountOptions(
            prefixicon: Icons.settings,
            text: const Text("Settings"),
          ),
        ],
      ),
    );
  }
}
