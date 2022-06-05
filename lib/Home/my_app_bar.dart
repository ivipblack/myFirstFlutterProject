import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBar(
      {Key? key, required this.title, required this.backgroundColor})
      : super(key: key);
  @override
  Size get PreferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      actions: [
        Text(
          'wellcome ${user.email!}',
          style: TextStyle(
            color: Color.fromARGB(255, 5, 72, 187),
            fontSize: 10,
          ),
        ),
        IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ))
      ],
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
