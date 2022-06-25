import 'package:flutter/material.dart';
import 'package:testapp/Home/first_page/cards.dart';
import 'package:testapp/Home/first_page/search_bar.dart';
import 'package:testapp/Home/main_view.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
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
        height: 255,
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: const BoxDecoration(
          color: customLightGreen,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(children: const [
          SearchBar(),
        ]));
  }
}
