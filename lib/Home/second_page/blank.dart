import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Home/main_view.dart';

class blank extends StatefulWidget {
  const blank({Key? key}) : super(key: key);

  @override
  State<blank> createState() => _blankState();
}

class _blankState extends State<blank> {
  @override
  final Color BBColor = Colors.pink;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
