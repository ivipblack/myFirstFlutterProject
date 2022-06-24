import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home/main_view.dart';
import 'package:testapp/Login_Sign_Up/utils.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double unit = MediaQuery.of(context).size.height * 0.01;
    return isEmailVerified
        ? const HomeScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Verify Email'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'a verification email has been sent to your email.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: unit * 4,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(unit * 6),
                    ),
                    icon: const Icon(Icons.email_outlined),
                    label: Text(
                      'Resend Email',
                      style: TextStyle(fontSize: unit * 2),
                    ),
                    onPressed: canResendEmail ? sendVerificationEmail : null,
                  ),
                  SizedBox(
                    height: unit * 4,
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(unit * 6),
                    ),
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: unit * 2),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
