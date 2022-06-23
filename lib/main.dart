import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Home/main_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testapp/Login_Sign_Up/utils.dart';
import 'package:testapp/login_sign_up/provider/google_sign_in.dart';
import 'Login_Sign_Up/authentication/AuthPage.dart';
import 'Login_Sign_Up/verify_email_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      // ignore: prefer_const_constructors
      MaterialApp(home: MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
          scaffoldMessengerKey: Utils.messengerKey1,
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
                  return VerifyEmailPage();
                } else {
                  return AuthPage(); //LoginView();
                }
              })),
    );
  }
}
