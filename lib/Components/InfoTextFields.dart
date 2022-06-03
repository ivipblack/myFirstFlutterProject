import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TField extends StatefulWidget {
  const TField({Key? key}) : super(key: key);

  @override
  State<TField> createState() => _TFieldState();
}

class _TFieldState extends State<TField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TextBox extends StatefulWidget {
  const TextBox({
    Key? key,
    required this.hint,
    isPassword,
  }) : super(key: key);

  final hint;

  @override
  Widget build(BuildContext context) {
    //String hint;
    double unit = MediaQuery.of(context).size.height * 0.01;
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(unit * 1)),
            labelText: hint,
            contentPadding: EdgeInsets.all(unit * 2),
            //prefixIcon: const Icon(Icons.email)),
          ),
        ),
        SizedBox(height: unit * 2)
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
