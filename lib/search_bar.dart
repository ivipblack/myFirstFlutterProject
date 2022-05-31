import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Container(
                  child: myMainTextField('Tap to Search'),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInBack,
                  child: myTextField('Select your Location'),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInBack,
                  child: myTextField('Select Date'),
                  )
              ]
    );
  }

  Container myMainTextField(text) {
    return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "$text",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )
              )
            ), 
          ),
      );
  }
  Container myTextField(text) {
    return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "$text",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )
              )
            ), 
          ),
    );
  }
}