// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:messerger/widgets/button_and_Text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //..... to story section
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 18.0, left: 4, right: 4),
              child: SizedBox(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => const ImageAvater(),
                  )),
            ),
            //.... add message section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Boldtext("Message"),
                Boldtext(" 48 New ", color: Colors.blue),
                const Spacer(flex: 70),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 30),
            //... search bar
            Container(
              width: MediaQuery.of(context).size.width - 20,
              child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Search Anything",
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)))),
            ),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: ((context, index) => const ChatBox())),
            )
          ],
        ),
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  const ChatBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 3, right: 4),
      child: Row(
        children: [
          const Spacer(flex: 2),
          const ImageAvater(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Boldtext("Nime Sorker"),
              const Text("HAllo"),
            ],
          ),
          const Spacer(flex: 20),
          Column(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.red.shade100,
                child: Boldtext("3"),
              ),
              const Text("\n 19 Sept")
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class ImageAvater extends StatelessWidget {
  const ImageAvater({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
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
              border:
                  Border.all(width: 3, color: Colors.white.withOpacity(0.5)),
            ),
            child: Container(
              height: 69,
              width: 69,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://th.bing.com/th/id/OIP.EZgDTtFqxq0ADDVhvyct3QHaHZ?pid=ImgDet&rs=1"),
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 14,
          right: 20,
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
