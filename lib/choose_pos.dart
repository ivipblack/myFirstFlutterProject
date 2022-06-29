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
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(2, 0.0),
    end: const Offset(0, 0.0),
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
                "Welcome Bitch !",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                    color: Colors.black87),
              ),
              SizedBox(
                height: unitHeightValue * 10,
              ),
              SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: customLightGreen,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(0.35),
                        spreadRadius: 30,
                        blurRadius: 30,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: unitWidthValue * 40,
                  height: unitHeightValue * 18,
                  child: Center(
                    child: const Text(
                      "Resort Owner",
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
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
                child: Center(
                  child: const Text(
                    "Stupid User",
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
