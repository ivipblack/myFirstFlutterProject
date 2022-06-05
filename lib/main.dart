import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home/Home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testapp/Login_Sign-Up/utils.dart';
import 'Login_Sign-Up/AuthPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      // ignore: prefer_const_constructors
      MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //this doesn't work
        scaffoldMessengerKey: Utils.messengerKey1,
        //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Vacation Rents',
        theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black87),
          fontFamily: 'OpenSans',
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Somthing went wrong!'));
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return AuthPage(); //LoginView();
              }
            }));
  }
}
