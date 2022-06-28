import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => LoadingIndicatorState();
}

class LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitCircle(
        size: 140,
        color: Colors.white,
      ),
    ));
  }
}
