import 'package:flutter/material.dart';
import 'package:testapp/Login_Sign-Up/utils.dart';

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
