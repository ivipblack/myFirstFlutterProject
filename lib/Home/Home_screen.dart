import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home/home_body.dart';
import 'package:testapp/Login_Sign-Up/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color.fromARGB(255, 220, 220, 220)]
              //or purple and orange
              )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: homeAppBar(context),
        body: const HomeBody(),
      ),
    );
  }

  AppBar homeAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'Vacation',
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      // ],
      // Uncomment this to have the arrow at the left
      actions: [
        Text(
          'wellcome ${user.email!}',
          style: TextStyle(
            color: Color.fromARGB(255, 5, 72, 187),
            fontSize: 10,
          ),
        ),
        IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ))
      ],
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
