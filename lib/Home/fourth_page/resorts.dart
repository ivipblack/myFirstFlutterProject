import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/Home/fourth_page/add_reseort.dart';
import 'package:testapp/Home/fourth_page/resort_card.dart';

class ResortsView extends StatefulWidget {
  const ResortsView({Key? key}) : super(key: key);

  @override
  State<ResortsView> createState() => _ResortsViewState();
}

class _ResortsViewState extends State<ResortsView> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('cards').snapshots();
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
          children: [
            Container(
              height: 250,
              child: StreamBuilder<QuerySnapshot>(
                stream: users,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final data = snapshot.requireData;
                    return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Owner Name: ${data.docs[index]['Owenr name']}"
                                "\nResort name: ${data.docs[index]['Resort name']}"
                                "\nLocation: ${data.docs[index]['location']}"),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            /* StreamBuilder<List<ResortCard>>(
                stream: readCards(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Soething went Wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final cards = snapshot.requireData;
                    return ListView(
                      children: cards.map(buildResortCard).toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }), */
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

  Widget buildResortCard(ResortCard resortCard) =>
      Text("${resortCard.ownerName}"
          "${resortCard.resortName}"
          "${resortCard.location}");

  Stream<List<ResortCard>> readCards() => FirebaseFirestore.instance
      .collection('cards')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ResortCard.fromJson(doc.data())).toList());
}
