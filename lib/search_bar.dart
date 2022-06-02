import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Uncomment this to stack your search Containers.
      //Stack(children: <Widget>[
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
                borderRadius: BorderRadius.circular(30),
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
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.solid,
              )),
        ),
      ),
    );
  }
}
