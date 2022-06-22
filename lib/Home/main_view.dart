import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Home/home_body.dart';
import 'package:testapp/search_bar.dart';

import '../provider/google_sign_in.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverAppBar(
                    stretch: true,
                    expandedHeight: 280,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 10, right: 8.0, left: 8.0),
                              child: TextField(
                                textAlign: TextAlign.justify,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon((Icons.search)),
                                    hintText: "text",
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
                            ),
                          ),
                          // SearchBar(),
                        ])
                        //Text('Home View'),

                        )),
              ],
          body: HomeBody()),
    );
  }
}
