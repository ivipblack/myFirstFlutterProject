import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
//import 'package:sliding_card/sliding_card.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  /* final cardController = TabController(length: 1, vsync: )
  late SlidingCardController controller;
  @override
  void initState() {
    super.initState();
    controller = SlidingCardController();
  } */

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Uncomment this to stack your search Containers.
      //Stack(children: <Widget>[
      /*  SlidingCard(
        slimeCardElevation: 0.5,
        cardsGap: 20,
        //The controller is necessary to animate the opening and closing of the card
        controller: ,
        slidingCardWidth: 90,
        visibleCardHeight: 27,
        //the card behind the front card can't have a higher
        // hight than the front one
        hiddenCardHeight: 15,
        //Configure your front card here
        frontCardWidget: myMainTextField(
            'Tap to Search', 8.0, 8.0), //configure your rear card here
        backCardWidget: myTextField('Select your Location', 8.0, 8.0),
      ), */

      myMainTextField('Tap to Search', 8.0, 8.0), // Text, Padding , Margin
      myTextField('Select your Location', 8.0, 8.0),
      myTextField('Select Date', 8.0, 8.0),
      //])
    ]);
  }

  Container myMainTextField(text, paddingValue, marginValue) {
    return Container(
      padding: EdgeInsets.only(top: paddingValue, right: 8.0, left: 8.0),
      margin: EdgeInsets.only(top: marginValue, right: 8.0, left: 8.0),
      child: TextField(
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
            prefixIcon: const Icon((Icons.search)),
            hintText: "$text",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  // width: 10,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ))),
      ),
    );
  }

  Container myTextField(text, paddingValue, marginValue) {
    return Container(
      padding: EdgeInsets.only(top: paddingValue, right: 8.0, left: 8.0),
      margin: EdgeInsets.only(top: marginValue, right: 8.0, left: 8.0),
      child: TextField(
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            (Icons.no_adult_content),
            color: Colors.white,
          ),
          // contentPadding: EdgeInsets.all(20.0),
          hintText: "$text",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.solid,
              )),
        ),
      ),
    );
  }
}
