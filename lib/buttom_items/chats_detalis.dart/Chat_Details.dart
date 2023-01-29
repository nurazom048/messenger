// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messerger/buttom_items/provider.dart/conversetionProvider.dart';
import 'package:messerger/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../../widgets/Coversetion_box.dart';
import '../../widgets/enum .dart';

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
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  //

  //

  @override
  Widget build(BuildContext context) {
    var conversetion = Provider.of<ConversationProvider>(context).conversetion;
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
                reverse: false,
                scrollDirection: Axis.vertical,
                //... only show acctive acccount
                itemCount: conversetion.length,
                itemBuilder: (context, index) {
                  return ConversetionBox(
                    message: conversetion[index]["Message"],
                    messagetype: conversetion[index]["message_type"],
                    time: conversetion[index]["time"],
                    isMe: conversetion[index]["is_me"],
                    previusTime: conversetion[index == 0 ? 0 : index - 1]
                        ["time"],
                    last: conversetion[conversetion.length - 1]["time"],
                    beforeLast: conversetion[conversetion.length - 2]["time"],
                    islast: index == conversetion.length - 1,
                    image: conversetion[index]["image"],
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
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.black45),
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
// Pick an image
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    //
                    if (image != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewImage(
                                  image: image.path,
                                  conversetion: conversetion)));
                    } else {
                      print('No image selected.');
                    }
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      hintText: "send message",
                      suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 9.0),
                          child: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              //
                              Map<String, dynamic> newMessage = {
                                "name": "nur",
                                "Message": _controller.text,
                                "is_me": true,
                                "time": DateTime.now(),
                              };
                              setState(() {
                                conversetion.add(newMessage);
                              });
                            },
                          )),
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

///
class ViewImage extends StatefulWidget {
  List<Map<String, dynamic>> conversetion;
  final String image;
  ViewImage({Key? key, required this.image, required this.conversetion})
      : super(key: key);

  @override
  State<ViewImage> createState() => _ViewImageState();
}

TextEditingController _controller = TextEditingController();

class _ViewImageState extends State<ViewImage> {
  void add() {
    Map<String, dynamic> newMessage = {
      "name": "nur",
      "Message": _controller.text.isEmpty ? "null" : _controller.text,
      "is_me": true,
      "time": DateTime.now(),
      "image": widget.image,
    };

    var conversetion = Provider.of<ConversationProvider>(context, listen: false)
        .addConversetion(newMessage);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.file(
              File(widget.image),
              fit: BoxFit.contain,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    hintText: "send message",
                  ),
                ),
              ),
              IconButton(icon: const Icon(Icons.send), onPressed: add),
            ],
          ),
        ],
      ),
    );
  }
}
