import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewClass extends StatefulWidget {
  const NewClass({Key? key, this.hint, this.isPassword}) : super(key: key);
  final hint;
  final isPassword;
  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  bool _isHiddenPassword = true;
  bool eyeIconFlag = false;
  Icon eyeIcon = const Icon(Icons.visibility_off);
  
  @override
  Widget build(BuildContext context) {
    double unit = MediaQuery.of(context).size.height * 0.01;
    if (isPassword == false) {
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
    } else {
      return Column(
        children: [
          TextField(
            obscureText: _isHiddenPassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1 * unit)),
                labelText: 'Password',
                // contentPadding: unit * 2,
                prefixIcon: const Icon(Icons.security),
                suffixIcon: InkWell(
                  onTap: _viewPassword,
                  child: eyeIcon,
                )),
          ),
        ],
      );
    }
  }

  void _viewPassword() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
      eyeIconFlag = !eyeIconFlag;
      eyeIcon = eyeIconFlag
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off);
    });
  }
}
