import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home/Home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/Login_Sign-Up/SignUp.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isHiddenPassword = true;
  bool eyeIconFlag = false;
  Icon eyeIcon = const Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unit = unitHeightValue;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(unitHeightValue * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.asset('publicAssets/images/realm.svg'),
              width: unitHeightValue * 20,
              height: unitHeightValue * 25,
            ),
            Text(
              'Welcome to Vacation!!',
              style: TextStyle(fontSize: unitHeightValue * 4),
            ),
            SizedBox(
              height: unitHeightValue * 4,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(unit * 1)),
                  labelText: 'Email',
                  contentPadding: EdgeInsets.all(unit * 3),
                  prefixIcon: const Icon(Icons.email)),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            TextField(
              obscureText: _isHiddenPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1 * unit)),
                  labelText: 'Password',
                  // contentPadding: unit * 2,
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
            Container(
              width: unitHeightValue * 50,
              height: unitHeightValue * 7.5,
              child: ElevatedButton(
                // style: ButtonStyle(
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(5.0),
                //             side: const BorderSide(color: Colors.grey, width: 2.0)))),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: unitHeightValue * 2),
                ),
              ),
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
                    Container(
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, unit * 0.3, 0),
                              child: Image.asset(
                                'publicAssets/images/google_btn.png',
                                width: unit * 1.5,
                              ),
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: unitHeightValue * 1.5,
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
            Padding(
              padding:
                  EdgeInsets.fromLTRB(unit * 8, unit * 2, unit * 1, unit * 1),
              child: Row(
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: unitHeightValue * 2.3,
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingupView()));
                    }),
                    child: Text(
                      'Create now !',
                      style: TextStyle(
                        fontSize: unitHeightValue * 2.3,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _viewPassword() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
      eyeIconFlag = !eyeIconFlag;
      eyeIcon = eyeIconFlag
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off);
    });
  }
}
