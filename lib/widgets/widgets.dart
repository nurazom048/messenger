// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

//*************** AccountOptions ***************** */

class AccountOptions extends StatelessWidget {
  final Widget? text;
  Widget? prefix, sufix;
  IconData? prefixicon;
  bool? sufixicon;
  String? title, subtitle;
  AccountOptions({
    this.text,
    this.sufixicon = true,
    this.prefixicon,
    this.prefix,
    this.sufix,
    this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      height: 70,
      width: double.infinity,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        prefix ??
            Icon(
              prefixicon,
              size: title != null && subtitle != null ? 42 : 30,
              color: Colors.blue,
            ),
        const Spacer(flex: 1),
        //.. text
        title != null && subtitle != null
            ? RichText(
                text: TextSpan(children: [
                TextSpan(
                    text: title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: "\n$subtitle",
                    style: const TextStyle(color: Colors.black54)),
              ]))
            : text!,
        const Spacer(flex: 20),
        sufix ?? Container(),
        sufixicon == true
            ? const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              )
            : Container(),
      ]),
    );
  }
}

//*************** ProfilePiccure ***************** */
class ProfilePiccure extends StatelessWidget {
  const ProfilePiccure({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0),
          ),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://th.bing.com/th/id/OIP.ocRtfehPnNTCzmrZsY9EjgAAAA?pid=ImgDet&rs=1"))),
    );
  }
}

class StoryIcon extends StatelessWidget {
  StoryIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
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
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.5)),
          ),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16,
              child: CircleAvatar(backgroundColor: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  double? thickness;
  MyDivider({
    this.thickness,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 26,
      thickness: thickness ?? .8,
      endIndent: 25,
      indent: 25,
    );
  }
}

//*********** SearchBar ********** */
class SearchBar extends StatelessWidget {
  double? top, bottom;
  SearchBar({
    Key? key,
    this.top,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      margin: EdgeInsets.only(top: top ?? 10, bottom: bottom ?? 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width - 20,
      child: const TextField(
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 8.0, right: 8, top: 8),
          hintText: "Search Anything",
          suffixIcon: Padding(
              padding: EdgeInsets.only(right: 9.0), child: Icon(Icons.search)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class AppbarCustom extends StatelessWidget {
  String profile_pictiure, title, subtitle;
  AppbarCustom({
    Key? key,
    required this.profile_pictiure,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          CircleAvatar(
              radius: 30, backgroundImage: NetworkImage(profile_pictiure)),
          //
          const Spacer(flex: 1),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              Text(subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 12))
            ],
          ),

          const Spacer(flex: 30),
          const Icon(Icons.more_vert, size: 30),
          const Spacer(flex: 3),

          //
        ],
      ),
    );
  }
}
