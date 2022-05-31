import 'package:flutter/material.dart';
import 'package:testapp/Home_screen.dart';

void main() {
  runApp(
    // ignore: prefer_const_constructors
    MaterialApp(
      home: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacation Rents',
      theme: ThemeData(
        primaryColor: Colors.amber, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black87),
      ),
    home: const HomeScreen(),
    );
  }
}