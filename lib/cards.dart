import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        aCard('First one', null, 999, 5),
        aCard('Second one', null, 999, 5),
        aCard('third one', null, 999, 5),
        aCard('forth one', null, 999, 5),
        aCard('fifth one', null, 999, 5),
        aCard('sixth one', null, 999, 5),
      ],
    );
  }

  Container aCard(title, img, price, rating) {
    return Container(
      height: 150,
      margin:const EdgeInsets.fromLTRB(10, 10, 10, 10) ,
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-0.75, -0.75),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 80.0,
              width: 80.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                  'assets/1595053125.jpg'
                  ),
                fit: BoxFit.fill,
                ),
              ),
            )
          )
        ]
      ),
    );
  }
}