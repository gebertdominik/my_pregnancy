import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:my_pregnancy/constants/colors.dart';
import 'package:my_pregnancy/screens/home/components/main_menu.dart';
import 'package:my_pregnancy/screens/home/components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration:
            BoxDecoration(color: kLightPinkColor),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [PregnancyProgress(), SearchBar(), MainMenu()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PregnancyProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Dzień dobry!",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              Text(
                "To już 7 miesiąc",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text("Do porodu pozostało 45 dni")
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical:20),
              child: Column(
                children: <Widget>[
                  Container(
                    // height: 150,
                    child: LiquidCustomProgressIndicator(
                      value: 0.8,
                      valueColor: AlwaysStoppedAnimation(Colors.pink),
                      // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors.white,
                      // Defaults to the current Theme's backgroundColor.
                      direction: Axis.vertical,
                      shapePath: _buildHeartPath(),
                      center: Text("35+3",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Path _buildHeartPath() {
  return Path()
    ..moveTo(55, 15)
    ..cubicTo(55, 12, 50, 0, 30, 0)
    ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
    ..cubicTo(0, 55, 20, 77, 55, 95)
    ..cubicTo(90, 77, 110, 55, 110, 37.5)
    ..cubicTo(110, 37.5, 110, 0, 80, 0)
    ..cubicTo(65, 0, 55, 12, 55, 15)
    ..close();
}