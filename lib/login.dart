import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(unitHeightValue * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // child: SvgPicture.asset(kLogoSvgAsset),
              width: unitHeightValue * 20,
              height: unitHeightValue * 20,
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)),
                hintText: 'Password',
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
