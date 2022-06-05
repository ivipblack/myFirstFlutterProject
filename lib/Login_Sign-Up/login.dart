import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home/Home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/Login_Sign-Up/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';

import '../main.dart';

class LoginView extends StatefulWidget {
  final VoidCallback onClickedSignup;

  const LoginView({Key? key, required this.onClickedSignup}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool _isHiddenPassword = true;
  bool isEyeCrossed = false;
  Icon eyeIcon = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unit = unitHeightValue;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(unit * 2, unit, unit * 2, unit),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: unitHeightValue * 20,
              height: unitHeightValue * 25,
              child: SvgPicture.asset('publicAssets/images/realm.svg'),
            ),
            Text(
              'Welcome to Vacation!!',
              style: TextStyle(fontSize: unitHeightValue * 4),
            ),
            SizedBox(
              height: unitHeightValue * 4,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(unit * 1)),
                  labelText: 'Email',
                  contentPadding: EdgeInsets.all(unit * 2),
                  prefixIcon: const Icon(Icons.email)),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            TextField(
              controller: passwordController,
              obscureText: _isHiddenPassword,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(unit * 2),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1 * unit)),
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.security),
                  suffixIcon: InkWell(
                    onTap: _viewPassword,
                    child: eyeIcon,
                  )),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            // ignore: sized_box_for_whitespace
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: unit * 6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      signIn();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HomeScreen()),
                      // );
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: unitHeightValue * 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: unitHeightValue * 1.5,
            ),
            Text(
              'Forgot password?',
              style: TextStyle(fontSize: unitHeightValue * 1.5),
            ),
            // Divider(),
            SizedBox(
              height: unitHeightValue * 3,
            ),
            GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: unitHeightValue * 20,
                      height: unitHeightValue * 7.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        // : Image.asset('publicAssets/images/google_btn.png'),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, unit * 0.6, 0),
                              width: unit * 3,
                              height: unit * 3,
                              child: SvgPicture.asset(
                                'publicAssets/images/google.svg',
                              ),
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: unit * 1.3,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Container(
                      width: unitHeightValue * 20,
                      height: unitHeightValue * 7.5,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        icon: const Icon(Icons.apple),
                        label: Text(
                          'Sign in with Apple',
                          style: TextStyle(
                            fontSize: unitHeightValue * 1.3,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: unit * 2,
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: unit * 2.3,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignup,
                    text: 'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding:
            //       EdgeInsets.fromLTRB(unit * 8, unit * 2, unit * 1, unit * 1),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Don\'t have an account? ',
            //         style: TextStyle(
            //           fontSize: unitHeightValue * 2.3,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: (() {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const SingupView()));
            //         }),
            //         child: Text(
            //           'Create now !',
            //           style: TextStyle(
            //             fontSize: unitHeightValue * 2.3,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => Center(child: CircularProgressIndicator()),
    // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void _viewPassword() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
      isEyeCrossed = !isEyeCrossed;
      eyeIcon = isEyeCrossed
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off);
    });
  }
}
