// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/Home/fourth_page/add_image.dart';
import 'package:testapp/Home/fourth_page/resort_card.dart';
import 'package:testapp/Home/main_view.dart';
import 'package:testapp/blocs/images/images_bloc.dart';

import '../../widgets/custom_image_container.dart';

class AddResort extends StatefulWidget {
  const AddResort({Key? key}) : super(key: key);

  @override
  State<AddResort> createState() => _AddResortState();
}

class _AddResortState extends State<AddResort> {
  final resortNameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  final cityList = ['AlQatif', 'Dammam', 'Khobar', 'Alhasa', 'Saihat'];
  final provienceList = ['Eastren Province', 'Westren Provience'];
  String? value;
  String? value2;
  final sb = StringBuffer();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unitWidthValue = MediaQuery.of(context).size.width * 0.01;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Add Resort',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(unitHeightValue * 2, unitHeightValue * 2,
              unitHeightValue * 2, unitHeightValue * 2),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  controller: resortNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(unitHeightValue * 0.7)),
                    labelText: 'Resort name',
                    contentPadding: EdgeInsets.all(unitHeightValue * 1),
                  ),
                ),
                SizedBox(
                  height: unitHeightValue * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Provience'),
                    Container(width: 105, child: Text('City')),
                  ],
                ),
                SizedBox(
                  height: unitHeightValue * 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: value,
                          items: provienceList.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value as String?),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 110,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: value2,
                          items: cityList.map(buildMenuItem).toList(),
                          onChanged: (value2) =>
                              setState(() => this.value2 = value2 as String?),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: unitHeightValue * 0.5,
                ),
                SizedBox(
                  height: unitHeightValue * 4,
                  child: const Text(
                    'Upload a Picture',
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageContainer(),
                        CustomImageContainer(),
                        CustomImageContainer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageContainer(),
                        CustomImageContainer(),
                        CustomImageContainer(),
                      ],
                    ),
                  ],
                ),

                /* SizedBox(
              height: unitHeightValue * 0.5,
            ),
            SizedBox(
              height: unitHeightValue * 4,
              child: const Text(
                'Upload a Picture',
              ),
            ), */
                /* Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ImagesBloc, ImagesState>(
                  builder: (context, state) {
                    if (state is ImagesLoading) {
                      return Center(
             child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ImagesLoaded) {
                      var imagesCount = state.imageUrls.length;

                      return Column(
             children: [
               Row(
                 //mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   (imagesCount > 0)
                       ? CustomImageContainer(
                           imageUrl: state.imageUrls[1])
                       : CustomImageContainer(),
                   CustomImageContainer(),
                   CustomImageContainer(),
                 ],
               ),
               Row(
                 //mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CustomImageContainer(),
                   CustomImageContainer(),
                   CustomImageContainer(),
                 ],
               ),
             ],
                      );
                    } else {
                      return Text('Something went wrong');
                    }
                  },
                ),
              ],
            ), */
                SizedBox(
                  height: unitHeightValue * 1,
                ),
                SizedBox(
                  width: double.infinity,
                  height: unitHeightValue * 5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: customBej,
                    ),
                    onPressed: () {
                      conc();
                      /* final card = ResortCard(
                    ownerName: user.displayName!,
                    resortName: resortNameController.text,
                    location: sb.toString(),
                    imageUrls: imageUrls;
        
                  );
                  createCard(card); */
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                          fontSize: unitHeightValue * 2, color: Colors.black38),
                    ),
                  ),
                ),
              ]),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        ),
      );

  void conc() {
    sb.write(value);
    sb.write(", ");
    sb.write(value2);
  }

  Future createCard(ResortCard resortCard) async {
    final docCard = FirebaseFirestore.instance.collection('cards').doc();
    resortCard.id = docCard.id;

    final json = resortCard.toJson();

    await docCard.set(json);
  }
}
