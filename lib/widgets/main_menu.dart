import 'package:flutter/material.dart';
import 'package:my_pregnancy/widgets/category_card.dart';

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
