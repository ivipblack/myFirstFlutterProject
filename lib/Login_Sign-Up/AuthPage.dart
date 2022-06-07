import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Login_Sign-Up/Sign_up.dart';
import 'package:testapp/Login_Sign-Up/login.dart';

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