import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:testapp/Login_Sign_Up/utils.dart';
import 'package:testapp/login_sign_up/provider/google_sign_in.dart';
import 'package:testapp/splash.dart';
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
          home: AnimatedSplashScreen(
              centered: true,
              splashIconSize: 200,
              splashTransition: SplashTransition.fadeTransition,
              splash: SplashScreen(),
              nextScreen: streamNaviation())),
    );
  }

  StreamBuilder<User?> streamNaviation() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Somthing went wrong!'));
          } else if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else {
            return const AuthPage(); //LoginView();
          }
        });
  }
}
