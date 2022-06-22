import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Home/Home_screen.dart';

class blank extends StatefulWidget {
  const blank({Key? key}) : super(key: key);

  @override
  State<blank> createState() => _blankState();
}

class _blankState extends State<blank> {
  @override
  final Color BBColor = Color.fromARGB(255, 144, 163, 163);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 24),
          ),
        )
      ]),
    );
  }
}
