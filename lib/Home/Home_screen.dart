// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Home/home_body.dart';
import 'package:testapp/Home/main_view.dart';
import 'package:testapp/Home/second_page/blank.dart';
import 'package:testapp/login_sign_up/authentication/AuthPage.dart';
import 'package:testapp/login_sign_up/login.dart';
import 'package:testapp/provider/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  final Color BBColor = Color.fromARGB(255, 144, 163, 163);
  final user = FirebaseAuth.instance.currentUser!;
  final screens = [
    HomeBody(),
    blank(),
    MainView(),
  ];

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
        backgroundColor: Color.fromARGB(111, 169, 203, 241),
        appBar: homeAppBar(context),
        body: screens[currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 300),
            height: 50,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            color: BBColor,
            buttonBackgroundColor: BBColor,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }

  AppBar homeAppBar(context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      title: Text(
        'Vacation',
        style: TextStyle(color: Color.fromARGB(255, 148, 209, 158)),
      ),

      actions: [
        Center(
          child: Text(
            ' ${user.displayName!}',
            style: TextStyle(
              color: Color.fromARGB(255, 5, 72, 187),
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        /* CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.photoURL!),
        ), */
        PopupMenuButton(
          icon: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          color: Colors.transparent,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: CircleAvatar(
                  child: Icon(Icons.logout_outlined),
                  radius: 25,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
