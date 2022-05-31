import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                myMainTextField('Tap to Search'),
                myTextField('Select your Location', 1),
                myTextField('Select Date', 2)
              ]
        ))
        ]
    );
  }

  Container myMainTextField(text) {
    return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: TextField(
            onTap: () {
               myTextField('Select your Location', 1);
               myTextField('Select Date', 1);
            },
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
  Container myTextField(text, duration) {
    return Container(
      // margin: const EdgeInsets.all(8),
        child: AnimatedContainer(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          duration: Duration(seconds: duration),
          
          curve: Curves.easeInBack,
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
      )
    );
  }
}