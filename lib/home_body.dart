import 'package:flutter/material.dart';
import 'package:testapp/cards.dart';
import 'package:testapp/search_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
                mainScreenContainer(),
                const Cards(),
              ],
            )
    );      // const SizedBox(height: 400)
  }

  Container mainScreenContainer() {
    return Container(
      height: 280,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
      ),
    ),
      child: Column(
        children: const [
          SearchBar(),
        ]
      ) 
    );
  }
}