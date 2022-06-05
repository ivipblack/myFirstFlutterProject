import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class blank extends StatefulWidget {
  const blank({Key? key}) : super(key: key);

  @override
  State<blank> createState() => _blankState();
}

class _blankState extends State<blank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text('data')]),
    );
  }
}
