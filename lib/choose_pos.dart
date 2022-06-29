import 'package:flutter/material.dart';
import 'package:testapp/Home/main_view.dart';

class ChoosePos extends StatefulWidget {
  const ChoosePos({Key? key}) : super(key: key);

  @override
  _ChoosePosState createState() => _ChoosePosState();
}

class _ChoosePosState extends State<ChoosePos>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double unitWidthValue = MediaQuery.of(context).size.width * 0.01;
    return Scaffold(
      backgroundColor: customWhite,
      body: Padding(
        padding: EdgeInsets.fromLTRB(unitHeightValue * 2, unitHeightValue,
            unitHeightValue * 2, unitHeightValue),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: unitHeightValue * 16,
              ),
              const Text(
                "Welcome Bitch!",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                  // height: unitHeightValue * 6,
                  ),
              SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: customLightGreen,
                  ),
                  width: unitWidthValue * 40,
                  height: unitHeightValue * 18,
                  child: const Text(
                    "Resort Owner",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: customLightGreen,
                ),
                width: unitWidthValue * 40,
                height: unitHeightValue * 18,
                child: const Text(
                  "Stupid User",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
