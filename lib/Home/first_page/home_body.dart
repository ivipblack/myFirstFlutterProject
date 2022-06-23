import 'package:flutter/material.dart';
import 'package:testapp/Home/first_page/cards.dart';
import 'package:testapp/Home/first_page/search_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      shrinkWrap: true,
      children: [
        mainScreenContainer(),
        const Cards(),
      ],
    ));
    // const SizedBox(height: 400)
  }

  Container mainScreenContainer() {
    return Container(
        height: 282,
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Column(children: const [
          SearchBar(),
        ]));
  }
}
