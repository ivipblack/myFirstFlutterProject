import 'package:flutter/material.dart';
import 'package:testapp/Home/Home_screen.dart';
import 'package:testapp/Login_Sign-Up/login.dart';

void main() {
  runApp(
    // ignore: prefer_const_constructors
    MaterialApp(home: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacation Rents',
      theme: ThemeData(
        primaryColor: Colors.amber,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.black87),
        fontFamily: 'OpenSans',
      ),
      home: const LoginView(),
    );
  }
}
