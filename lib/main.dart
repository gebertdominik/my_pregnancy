import 'package:flutter/material.dart';
import 'package:my_pregnancy/constants/colors.dart';
import 'package:my_pregnancy/widgets/category_card.dart';
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
                children: [
                  Text(
                    "Dzień dobry!",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  MainMenu()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: .85,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      children: <Widget>[
        CategoryCard(
            title: "Moja Ciąża",
            svgSrc: "assets/icons/my_pregnancy.svg",
            press: () {}),
        CategoryCard(
            title: "Artykuły",
            svgSrc: "assets/icons/articles.svg",
            press: () {}),
        CategoryCard(
            title: "Promocje",
            svgSrc: "assets/icons/promotions.svg",
            press: () {}),
        CategoryCard(
            title: "Quiz",
            svgSrc: "assets/icons/quiz.svg",
            press: () {}),
        CategoryCard(
            title: "Kontakt",
            svgSrc: "assets/icons/contact.svg",
            press: () {}),
        CategoryCard(
            title: "Ustawienia",
            svgSrc: "assets/icons/settings.svg",
            press: () {})
      ],
    ));
  }
}
