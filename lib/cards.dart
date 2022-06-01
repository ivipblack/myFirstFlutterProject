import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        aCard('First one', 'images/1595053125.jpg', 999, 5),
        aCard('Second one', 'images/preview_sh-lyh-hn-y_0M38R2Yi.jpg', 999, 5),
        aCard('third one', 'images/preview_str-h-bo-b-lshrk_eN7VpoyB.jpg', 999, 5),
        aCard('forth one', 'images/Yd9yqR4W_400x400.jpg', 999, 5),
        aCard('fifth one', 'images/preview_sh-lyh-hn-y_0M38R2Yi.jpg', 999, 5),
        aCard('sixth one', 'images/Yd9yqR4W_400x400.jpg', 999, 5),
      ],
    );
  }

  Container aCard(title, img, price, rating) {
    return Container(
      height: 150,
      margin:const EdgeInsets.fromLTRB(10, 10, 10, 10) ,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: const Alignment(0, -1),
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22
              )
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                 topRight: Radius.circular(40),
                 bottomRight: Radius.circular(40),
                ),
              child: Image.asset(img, 
                width:100, 
                height: 200,
                fit: BoxFit.cover,
            )
            )
          )
        ]
      ),
    );
  }
}