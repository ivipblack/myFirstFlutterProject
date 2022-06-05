import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Home/Home_screen.dart';

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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool _isHiddenPassword = true;
  bool eyeIconFlag = false;
  Icon eyeIcon = const Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;

    double unit = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(
      appBar: homeAppBar(context),
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
                obscureText: _isHiddenPassword,
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
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Password must be at least 6 characters'
                        : null,
              ),
              SizedBox(height: unit * 2),
              //TF(true, 'Confirm password ', unit),
              Container(
                height: unit * 6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    signUp();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const HomeScreen()),
                    // );
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

  Column TF(isPassword, hint, unit) {
    if (isPassword == false) {
      return Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(unit * 1)),
              hintText: hint,
              contentPadding: EdgeInsets.all(unit * 2),
              //prefixIcon: const Icon(Icons.email)),
            ),
          ),
          SizedBox(height: unit * 2)
        ],
      );
    } else {
      return Column(
        children: [
          TextField(
            controller: passwordController,
            obscureText: _isHiddenPassword,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(unit * 2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(unit * 1)),
                hintText: hint,
                // contentPadding: unit * 2,
                //  prefixIcon: const Icon(Icons.security),
                suffixIcon: InkWell(
                  onTap: _viewPassword,
                  child: eyeIcon,
                )),
          ),
          SizedBox(height: unit * 2),
        ],
      );
    }
  }

  void _viewPassword() {
    bool _isHiddenPassword = true;
    bool eyeIconFlag = false;
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
      eyeIconFlag = !eyeIconFlag;
      eyeIcon = eyeIconFlag
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off);
    });
  }

  AppBar homeAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'Vacation',
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      // ],
      // Uncomment this to have the arrow at the left

      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();

    //this doesn't work
    //both of them

    //if (!isValid) return;

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => Center(child: CircularProgressIndicator()),
    // );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
