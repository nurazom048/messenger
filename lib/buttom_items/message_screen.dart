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
                const Spacer(flex: 2),
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
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.search),
                      ),
                      prefixText: "Search Anything",
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
              const Text("19 SEP")
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
        Positioned(
          bottom: 14,
          right: 20,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          ),
        ),
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            padding: const EdgeInsets.all(.2),
            height: 76,
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.red,
                Colors.white38,
                Colors.pink,
              ]),
            ),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const CircleAvatar(
                radius: 29,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/f9/38/f4/f938f45fd061e612e68bdf25a282b641--suit-men-the-suits.jpg"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
