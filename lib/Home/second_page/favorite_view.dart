import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  final Color BBColor = Colors.pink;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
