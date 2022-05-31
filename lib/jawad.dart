import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
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
              child: Image.asset('assets/logo.png'),
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
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            Container(
                width: unitHeightValue * 12,
                height: unitHeightValue * 5,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black45),
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: unitHeightValue * 2),
                    )
                )
            ),
            SizedBox(height: unitHeightValue * 1.5,),
            Text('Forgot password?', style: TextStyle(fontSize: unitHeightValue * 1.5),),
            SizedBox(height: unitHeightValue * 2,),
            Text('Create Account', style: TextStyle(fontSize: unitHeightValue*2),)
          ],
        ),
      ),
    );
  }
}