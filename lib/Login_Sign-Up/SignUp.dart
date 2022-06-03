import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Components/InfoTextFields.dart';
import 'package:testapp/Components/new.dart';

class SingupView extends StatefulWidget {
  const SingupView({Key? key}) : super(key: key);

  @override
  State<SingupView> createState() => _SingupViewState();
}

class _SingupViewState extends State<SingupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // appBar: homeAppBar(context),
            NewClass(
              hint: 'Enter name',
              isPassword: false,
            ),
            NewClass(
              hint: 'Enter password',
              isPassword: true,
            )
          ],
        ),
      ),
    );
  }
}
