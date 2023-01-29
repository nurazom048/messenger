import 'package:flutter/cupertino.dart';
import '../../widgets/enum .dart';

import 'package:flutter/material.dart';

class ConversationProvider with ChangeNotifier {
//
  List<Map<String, dynamic>> conversetion = [
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": false,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": "null",
      "video": "null",
      "audio": "null",
      "file": "null",
    },
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": false,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": "null",
      "video": "null",
      "audio": "null",
      "file": "null",
    },
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 11, 40),

      "is_me": true,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": "null",
      "video": "null",
      "audio": "null",
      "file": "null",
    },
    {
      "name": "sabbir",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": true,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": "null",
      "video": "null",
      "audio": "null",
      "file": "null",
    },
    {
      "name": "DF",
      "time": DateTime(2022, 01, 23, 01, 12),

      "is_me": false,
      "message_type": message_type.text,
      "Message": "hello", // audio video image file text
      "image": "null",
      "video": "null",
      "audio": "null",
      "file": "null",
    },
  ];

  //
  void addConversetion(Map<String, dynamic> newMessage) {
    conversetion.add(newMessage);
    notifyListeners();
  }
}
