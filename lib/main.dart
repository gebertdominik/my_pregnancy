import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:my_pregnancy/constants/colors.dart';
import 'package:my_pregnancy/widgets/main_menu.dart';
import 'package:my_pregnancy/widgets/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moja ciąża',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

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
                BoxDecoration(color: Color.fromRGBO(245, 153, 153, 100)),
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
                    height: 150,
                    child: LiquidCircularProgressIndicator(
                      value: 0.8,
                      valueColor: AlwaysStoppedAnimation(Colors.pink),
                      // Defaults to the current Theme's accentColor.
                      backgroundColor: Colors.white,
                      // Defaults to the current Theme's backgroundColor.
                      direction: Axis.vertical,
                      center: Text("32+3",
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
