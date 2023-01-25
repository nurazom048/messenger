// ignore_for_file: unused_local_variable, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messerger/buttom_items/message_screen.dart';
import 'package:messerger/widgets/button_and_Text.dart';
import 'package:messerger/widgets/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

enum MessageStatus { seen, unseen, delivered, sent }

enum CallStatus { Missed_call, Recived_call, Dial_call }

enum Calltype { video, audio }

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  //
  List<Map<String, dynamic>> calls = [
    {
      "name": "Nur",
      "profile_pictiure":
          "https://th.bing.com/th/id/OIP.gHYfltewlh8hQERD9UF69AAAAA?pid=ImgDet&rs=1",
      "online_stutes": "online",
      "has_stroty": true,
      "last_call_duration": 2.05,
      "callstaus": CallStatus.Dial_call,
      "call_type": Calltype.audio,
      "call_time": DateTime(2022, 09, 03, 00, 00),
    },
    {
      "name": "Nur",
      "profile_pictiure":
          "https://th.bing.com/th/id/OIP.gHYfltewlh8hQERD9UF69AAAAA?pid=ImgDet&rs=1",
      "online_stutes": "online",
      "has_stroty": true,
      "last_call_duration": 2.05,
      "callstaus": CallStatus.Recived_call,
      "call_type": Calltype.audio,
      "call_time": DateTime(2022, 09, 03, 00, 00),
    },
    {
      "name": "Nur",
      "profile_pictiure":
          "https://th.bing.com/th/id/OIP.gHYfltewlh8hQERD9UF69AAAAA?pid=ImgDet&rs=1",
      "online_stutes": "online",
      "has_stroty": true,
      "last_call_duration": 185,
      "callstaus": CallStatus.Recived_call,
      "call_type": Calltype.video,
      "call_time": DateTime(2022, 09, 03, 00, 00),
    },
    {
      "name": "Nur",
      "profile_pictiure":
          "https://th.bing.com/th/id/OIP.gHYfltewlh8hQERD9UF69AAAAA?pid=ImgDet&rs=1",
      "online_stutes": "online",
      "has_stroty": true,
      "last_call_duration": 2.05,
      "callstaus": CallStatus.Missed_call,
      "call_type": Calltype.audio,
      "call_time": DateTime(2022, 09, 03, 00, 00),
    },
    //
  ];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    //... filter mised call from list
    final missedCalls = calls
        .where((call) => call["callstaus"] == CallStatus.Missed_call)
        .toList();
    //
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Boldtext("Calls", fontSize: 30)),
              //.. toggle
              ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.blue.shade300],
                  [Colors.blue.shade300]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white54,
                //inactiveFgColor: Colors.black26,
                initialLabelIndex: currentindex,
                totalSwitches: 2,
                labels: const ['All', 'Mised'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    currentindex = index!;
                  });
                },
              ),
              //....search bar
              SearchBar(
                top: 30,
                bottom: 10,
              ),

              //.... list of All calls

              Container(
                margin: const EdgeInsets.only(top: 18.0, left: 8, right: 8),
                height: MediaQuery.of(context).size.height - 30,
                width: MediaQuery.of(context).size.width,
                child: currentindex == 0
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: calls.length,
                        itemBuilder: ((context, index) {
                          return CallBox(
                            name: calls[index]["name"],
                            profile_picture: calls[index]["profile_pictiure"],
                            online_stutes: calls[index]["online_stutes"],
                            has_stroty: calls[index]["has_stroty"],
                            call_time: calls[index]["call_time"],
                            last_call_duration: calls[index]
                                ["last_call_duration"],
                            callstaus: calls[index]["callstaus"],
                            calltype: calls[index]["call_type"],
                          );
                        }),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: missedCalls.length,
                        itemBuilder: ((context, index) {
                          return CallBox(
                            name: missedCalls[index]["name"],
                            profile_picture: missedCalls[index]
                                ["profile_pictiure"],
                            online_stutes: missedCalls[index]["online_stutes"],
                            has_stroty: missedCalls[index]["has_stroty"],
                            call_time: missedCalls[index]["call_time"],
                            last_call_duration: missedCalls[index]
                                ["last_call_duration"],
                            callstaus: missedCalls[index]["callstaus"],
                            calltype: missedCalls[index]["call_type"],
                          );
                        }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//..

class CallBox extends StatelessWidget {
  String name, online_stutes, profile_picture;
  bool has_stroty;

  CallStatus callstaus;
  Calltype calltype;
  dynamic last_call_duration;
  DateTime call_time;

  CallBox({
    super.key,
    required this.name,
    required this.profile_picture,
    required this.online_stutes,
    required this.has_stroty,
    required this.call_time,
    required this.last_call_duration,
    required this.callstaus,
    required this.calltype,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 3, right: 4),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(flex: 2),
              //...
              ImageAvater(
                  profilepicture: profile_picture,
                  online_stutes: online_stutes,
                  has_story: has_stroty),
              //... name and last message
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Boldtext(name),
                  Row(
                    children: [
                      Icon(
                          calltype.name == "video"
                              ? Icons.videocam
                              : Icons.call,
                          size: 17),
                      Text(
                          " ${callstaus.name == "Recived_call" ? last_call_duration : callstaus.name}"),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 20),
              // ... last call time and icon
              Column(
                children: [
                  callstaus.name == "Missed_call"
                      ? const Icon(
                          Icons.phone_callback_sharp,
                          color: Colors.red,
                        )
                      : callstaus.name == "Recived_call"
                          ? const Icon(
                              Icons.phone_callback_sharp,
                              color: Colors.blue,
                            )
                          : callstaus.name == "Dial_call"
                              ? const Icon(
                                  Icons.call_outlined,
                                  color: Colors.green,
                                )
                              : Container(),

                  const SizedBox(height: 4),
                  Text(DateFormat.MMMEd().format(call_time)) // last call time
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
          MyDivider()
        ],
      ),
    );
  }
}
