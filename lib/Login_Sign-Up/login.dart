import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home/Home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    int n = 0;
    Icon eyeIcon = Icon(
      Icons.man,
    );
    bool flag = false;
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
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
              'Sign in',
              style: TextStyle(fontSize: unitHeightValue * 4),
            ),
            SizedBox(
              height: unitHeightValue * 4,
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                labelText: 'Email',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                labelText: 'Password',
                suffixIcon: IconButton(
                    // child: eyeIcon,
                    onPressed: () => setState(() {
                          flag = !flag;
                        }),
                    icon: flag
                        ? Icon(Icons.abc_outlined)
                        : Icon(Icons.remove_red_eye)),
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            Container(
              width: unitHeightValue * 12,
              height: unitHeightValue * 5,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey, width: 2.0)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
            SizedBox(
              height: unitHeightValue * 2,
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "myRoute");
              },
              child: new Text(
                "Create Account",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
