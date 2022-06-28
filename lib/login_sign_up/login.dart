import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/Login_Sign_Up/utils.dart';
import 'package:testapp/login_sign_up/provider/google_sign_in.dart';
import 'package:testapp/splash.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../main.dart';
import 'forgot_password_page.dart';

class LoginView extends StatefulWidget {
  final VoidCallback onClickedSignup;

  const LoginView({Key? key, required this.onClickedSignup}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unitWidthValue = MediaQuery.of(context).size.width * 0.01;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: WaveWidget(
                config: CustomConfig(
                  colors: [
                    Colors.white70,
                    Colors.white54,
                    Colors.white30,
                    Colors.white24,
                  ],
                  durations: [18000, 8000, 5000, 12000],
                  heightPercentages: [0.65, 0.66, 0.68, 0.70],
                ),
                size: const Size(double.infinity, double.infinity),
                backgroundColor: Color.fromARGB(255, 42, 152, 243),
                waveAmplitude: 0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(unitHeightValue * 2, unitHeightValue,
                  unitHeightValue * 2, unitHeightValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*  const SizedBox(
                    height: 20,
                  ), */
                  //The SizedBox for the img in the login page
                  SizedBox(
                    width: unitHeightValue * 50,
                    height: unitHeightValue * 30,
                    child: Image.asset('publicAssets/images/beach.jpg',
                        fit: BoxFit.fill),
                  ),
                  Text(
                    'Locare',
                    style: TextStyle(fontSize: unitHeightValue * 4),
                  ),
                  SizedBox(
                    height: unitHeightValue * 4,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(unitHeightValue * 1)),
                        labelText: 'Email',
                        contentPadding: EdgeInsets.all(unitHeightValue * 2),
                        prefixIcon: const Icon(Icons.email)),
                  ),
                  SizedBox(
                    height: unitHeightValue * 2,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: _isHiddenPassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(unitHeightValue * 2),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(1 * unitHeightValue)),
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
                      SizedBox(
                        height: unitHeightValue * 6,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            signIn();
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
                  GestureDetector(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontSize: unitHeightValue * 1.8,
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    )),
                  ),
                  // Divider(),
                  SizedBox(
                    height: unitHeightValue * 1,
                  ),
                  Text(
                    'Sign in with: ',
                    style: TextStyle(
                      fontSize: unitWidthValue * 3.3,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: unitHeightValue * 3,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), //<-- SEE HERE
                            padding: EdgeInsets.all(20),
                            onPrimary: Colors.white,
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => Center(
                                  child: SpinKitCircle(
                                size: 140,
                                color: Colors.white,
                              )),
                            );

                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop((route) => route.isFirst);
                            });
                          },
                          child: SvgPicture.asset(
                            'publicAssets/images/google.svg',
                            width: unitWidthValue * 3,
                            height: unitHeightValue * 3,
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), //<-- SEE HERE
                            padding: EdgeInsets.all(20),
                            onPrimary: Colors.white,
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            loading();
                          },
                          child: Icon(
                            Icons.apple,
                            size: 25,
                          )),
                      /*  ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize:
                              Size(unitHeightValue * 7, unitHeightValue * 7),
                        ),
                        //or
                        // icon: FaIcon(FontAwesomeIcons.google),
                        icon: SvgPicture.asset(
                          'publicAssets/images/google.svg',
                          width: unitWidthValue * 3,
                          height: unitHeightValue * 3,
                        ),
                        label: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: unitWidthValue * 3.3,
                            color: Colors.black87,
                          ),
                        ),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                      ), */
                      //const Spacer(),
                      // SizedBox(
                      //   width: unit * 9,
                      // ),
                      /*  ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          minimumSize: Size(50, unitHeightValue * 7),
                        ),
                        icon: const Icon(Icons.apple),
                        label: Text(
                          'Sign in with Apple',
                          style: TextStyle(
                            fontSize: unitWidthValue * 3.3,
                            color: Colors.white70,
                          ),
                        ),
                        onPressed: () {},
                      ), */
                    ],
                  ),

                  SizedBox(
                    height: unitHeightValue * 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: unitHeightValue * 2.3,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    /* showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    ); */
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);

      Utils.showSnackBar(e.message);
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

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
          child: SpinKitCircle(
        size: 140,
        color: Colors.white,
      )),
    );
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context, rootNavigator: true).pop((route) => route.isFirst);
    });
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
