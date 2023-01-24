// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

//*************** AccountOptions ***************** */

class AccountOptions extends StatelessWidget {
  final Widget text;
  Widget? prefix, sufix;
  IconData? prefixicon;
  bool? sufixicon = false;

  AccountOptions({
    required this.text,
    this.prefixicon,
    this.prefix,
    this.sufix,
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
              size: 30,
              color: Colors.blue,
            ),
        const Spacer(flex: 1),
        text,
        const Spacer(flex: 20),
        sufix ?? Container(),
        sufixicon! == false
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
