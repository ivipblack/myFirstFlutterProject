import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Home/fourth_page/add_reseort.dart';

class ResortsView extends StatefulWidget {
  const ResortsView({Key? key}) : super(key: key);

  @override
  State<ResortsView> createState() => _ResortsViewState();
}

class _ResortsViewState extends State<ResortsView> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unitWidthValue = MediaQuery.of(context).size.width * 0.01;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(unitHeightValue * 1)),
                labelText: 'name',
                contentPadding: EdgeInsets.all(unitHeightValue * 2),
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            TextField(
                controller: locationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(unitHeightValue * 1)),
                  labelText: 'location',
                  contentPadding: EdgeInsets.all(unitHeightValue * 2),
                )),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: unitHeightValue * 6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 157, 204, 119),
                    ),
                    onPressed: () {
                      final card = ResortCard(
                        name: nameController.text,
                        location: locationController.text,
                      );
                      createCard(card);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(fontSize: unitHeightValue * 2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddResort(),
          ));
        },
        //tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Stream<List<ResortCard>> readCards() => FirebaseFirestore.instance
      .collection('cards')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ResortCard.fromJson(doc.data())).toList());

  Future createCard(ResortCard resortCard) async {
    final docCard = FirebaseFirestore.instance.collection('cards').doc();
    resortCard.id = docCard.id;

    final json = resortCard.toJson();

    await docCard.set(json);
  }
}

class ResortCard {
  String id;
  final String name;
  final String location;

  ResortCard({
    this.id = '',
    required this.name,
    required this.location,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'location': location};

  static ResortCard fromJson(Map<String, dynamic> json) => ResortCard(
      id: json['id'], name: json['name'], location: json['location']);
}
