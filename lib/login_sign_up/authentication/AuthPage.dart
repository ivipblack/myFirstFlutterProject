// ignore_for_file: file_names, implementation_imports

import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/login_sign_up/Sign_up.dart';
import 'package:testapp/login_sign_up/login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginView(onClickedSignup: toggle)
      : SingupView(onClickedSignIn: toggle);
  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
