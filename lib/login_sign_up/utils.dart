import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static var messengerKey1 = messengerKey;

  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

    Utils.messengerKey1.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
