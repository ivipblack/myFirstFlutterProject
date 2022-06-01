import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myMainTextField('Tap to Search'),
        myTextField('Select your Location'),
        myTextField('Select Date'),
      ]  
    );
  }

  Container myMainTextField(text) {
    return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
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
                )
              ),
            ), 
          ),
    );
  }
}