import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
            Text("${user.displayName}"),
            Text("${user.email}"),
            SizedBox(
              height: 48,
              child: WaveWidget(
                config: CustomConfig(
                  colors: [
                    Colors.indigo[400]!,
                    Colors.indigo[300]!,
                    Colors.indigo[200]!,
                    Colors.indigo[100]!
                  ],
                  durations: [18000, 8000, 5000, 12000],
                  heightPercentages: [0.65, 0.66, 0.68, 0.70],
                ),
                size: const Size(double.infinity, double.infinity),
                waveAmplitude: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
