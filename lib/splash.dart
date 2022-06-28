import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double marginHorizontal = 16.0;

  @override
  Widget build(BuildContext context) {
    marginHorizontal = 16.0 +
        (MediaQuery.of(context).size.width > 512
            ? (MediaQuery.of(context).size.width - 512) / 2
            : 0);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Align(
          child: Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Color(0xFF9B5DE5),
                blurRadius: 2.0,
                spreadRadius: -5.0,
                offset: Offset(0.0, 8.0),
              ),
            ]),
            child: ClipOval(
              child: WaveWidget(
                config: CustomConfig(
                  colors: [
                    const Color(0xFFFEE440),
                    const Color(0xFF00BBF9),
                  ],
                  durations: [
                    5000,
                    4000,
                  ],
                  heightPercentages: [
                    0.65,
                    0.66,
                  ],
                ),
                backgroundColor: const Color(0xFFF15BB5),
                size: const Size(double.infinity, double.infinity),
                waveAmplitude: 0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'Locare',
            style: TextStyle(fontSize: 30),
          ),
        )
      ],
    ));
  }
}
