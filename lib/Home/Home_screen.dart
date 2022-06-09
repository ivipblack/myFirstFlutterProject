import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Home/home_body.dart';
import 'package:testapp/Login_Sign-Up/login.dart';
import 'package:testapp/provider/google_sign_in.dart';

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
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      title: Text(
        'Vacation',
        style: TextStyle(color: Color.fromARGB(255, 16, 126, 34)),
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
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.photoURL!),
        ),
        PopupMenuButton(
          color: Colors.white,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: IconButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.logout();
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.pink,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
