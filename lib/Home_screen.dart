import 'package:flutter/material.dart';
import 'package:testapp/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange]
            )
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: homeAppBar(),
        body: const HomeBody(),
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Vacation!!'),
      backgroundColor: Colors.black38,

    );
  }
}