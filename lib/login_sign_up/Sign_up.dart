// ignore_for_file: file_names

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../main.dart';
import 'utils.dart';

class SingupView extends StatefulWidget {
  final Function() onClickedSignIn;
  const SingupView({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SingupView> createState() => _SingupViewState();
}

class _SingupViewState extends State<SingupView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confrimPasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool isHiddenPassword = true;
  bool eyeIconFlag = false;
  Icon eyeIcon = const Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;

    double unit = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TF(false, 'Enter your email', unit),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(unit * 1)),
                  hintText: 'Enter your Email',
                  contentPadding: EdgeInsets.all(unit * 2),
                  //prefixIcon: const Icon(Icons.email)),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              SizedBox(height: unit * 2),
              //TF(true, 'Enter your password', unit),
              TextFormField(
                controller: passwordController,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(unit * 2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(unit * 1)),
                    hintText: 'Enter your password',
                    // contentPadding: unit * 2,
                    //  prefixIcon: const Icon(Icons.security),
                    suffixIcon: InkWell(
                      onTap: _viewPassword,
                      child: eyeIcon,
                    )),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
              ),
              SizedBox(height: unit * 2),
              TextFormField(
                controller: confrimPasswordController,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(unit * 2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(unit * 1)),
                    hintText: 'Confirm your password',
                    // contentPadding: unit * 2,
                    //  prefixIcon: const Icon(Icons.security),
                    suffixIcon: InkWell(
                      onTap: _viewPassword,
                      child: eyeIcon,
                    )),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
              ),
              SizedBox(height: unit * 2),

              SizedBox(
                height: unit * 6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    // _onLoading();
                    if (confrimPasswordController.text.trim() !=
                        passwordController.text.trim()) {
                      Utils.showSnackBar('Passwords don\'t match');
                    } else {
                      signUp();
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: unitHeightValue * 2),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: unit * 2.3,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Sign In',
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
      ),
    );
  }

  void _viewPassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
      eyeIconFlag = !eyeIconFlag;
      eyeIcon = eyeIconFlag
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
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: CircularProgressIndicator(),
        );
      },
    );
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    });
  }

  Future signUp() async {
    //final isValid = formKey.currentState!.validate();

    //if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
          child: SpinKitCircle(
        size: 140,
        color: Colors.white,
      )),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print

      print(e);
      Utils.showSnackBar(e.message);
    }
    Navigator.of(context, rootNavigator: true).pop((route) => route.isFirst);

    /* Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }); */
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
