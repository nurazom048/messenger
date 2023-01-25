import 'package:flutter/material.dart';
import 'package:messerger/buttom_items/Chat_Details.dart';
import 'package:messerger/widgets/widgets.dart';

class ChatDetails extends StatefulWidget {
  String profile_pictiure, name, online_stutes;
  ChatDetails({
    super.key,
    required this.profile_pictiure,
    required this.name,
    required this.online_stutes,
  });

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
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
                scrollDirection: Axis.vertical,
                //... only show acctive acccount
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                          height: 70,
                          width: 100,
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                          height: 70,
                          width: 100,
                        ),
                      ),
                    ],
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
              children: const [
                Icon(Icons.attach_file, color: Colors.black45),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      hintText: "send message",
                      suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 9.0),
                          child: Icon(Icons.send)),
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
