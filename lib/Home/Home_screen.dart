import 'package:flutter/material.dart';
import 'package:testapp/Home/home_body.dart';
import 'package:testapp/Login_Sign-Up/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color.fromARGB(255, 220, 220, 220)]
              //or purple and orange
              )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: homeAppBar(context),
        body: const HomeBody(),
      ),
    );
  }

  AppBar homeAppBar(context) {
    return AppBar(
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
              ),
              const SizedBox(
                width: 90,
              ),
              const Text(
                'Vacation!!',
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        )
      ],
      // title: const Text('Vacation!!',
      // style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      // ),
      backgroundColor: Colors.white,
    );
  }
}
