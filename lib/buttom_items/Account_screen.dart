// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
          Stack(
            children: [
              const ProfilePiccure(),
              Positioned(
                left: 4,
                top: 120,
                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width - 90,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                ),
              ),
            ],
          ),
          const Spacer(),

          //.... Account Screen options
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
                    style: TextStyle(color: Colors.black54),
                  ),
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
