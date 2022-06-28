import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddResort extends StatefulWidget {
  const AddResort({Key? key}) : super(key: key);

  @override
  State<AddResort> createState() => _AddResortState();
}

class _AddResortState extends State<AddResort> {
  final cityList = ['AlQatif', 'Dammam', 'Khobar', 'Alhasa', 'Saihat'];
  final provienceList = ['Eastren Province', 'Westren Provience'];
  String? value;
  String? value2;
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unitWidthValue = MediaQuery.of(context).size.width * 0.01;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Resort',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(unitHeightValue * 2, unitHeightValue,
            unitHeightValue * 2, unitHeightValue),
        child: Column(
          children: [
            TextField(
              // controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(unitHeightValue * 1)),
                labelText: 'Resort name',
                contentPadding: EdgeInsets.all(unitHeightValue * 2),
              ),
            ),
            SizedBox(
              height: unitHeightValue * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Provience'),
                Text('City'),
              ],
            ),
            SizedBox(
              height: unitHeightValue * 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: provienceList.map(buildMenuItem).toList(),
                      onChanged: (value) => this.value = value as String?,
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value2,
                      items: cityList.map(buildMenuItem).toList(),
                      onChanged: (value2) => this.value2 = value2 as String?,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(),
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        ),
      );
}
