import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_pregnancy/models/promotion.dart';
import 'package:my_pregnancy/screens/articles/articles_screen.dart';
import 'package:my_pregnancy/screens/contact/contact_screen.dart';
import 'package:my_pregnancy/screens/my_pregnancy/my_pregnancy_screen.dart';
import 'package:my_pregnancy/screens/promotions/promotions_screen.dart';
import 'package:my_pregnancy/screens/quiz/quiz_screen.dart';
import 'package:my_pregnancy/screens/settings/settings_screen.dart';
import 'package:my_pregnancy/screens/home/components/category_card.dart';
import 'package:provider/provider.dart';

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
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyPregnancyScreen();
                },
              ),
            );
          },
        ),
        CategoryCard(
            title: "Artykuły",
            svgSrc: "assets/icons/articles.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ArticlesScreen();
                  },
                ),
              );
            },),
        CategoryCard(
            title: "Promocje",
            svgSrc: "assets/icons/promotions.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MultiProvider(
                      providers: [
                        StreamProvider<List<Promotion>>(create: (_) => streamOfPromotions(), initialData: []),
                    ],
                      child: PromotionsScreen(),
                    );
                  },
                ),
              );
            },),
        CategoryCard(
            title: "Quiz", svgSrc: "assets/icons/quiz.svg", press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return QuizScreen();
              },
            ),
          );
        },),
        CategoryCard(
            title: "Kontakt", svgSrc: "assets/icons/contact.svg", press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ContactScreen();
              },
            ),
          );
        },),
        CategoryCard(
            title: "Ustawienia",
            svgSrc: "assets/icons/settings.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ),
              );
            },)
      ],
    ));
  }
}


Stream<List<Promotion>> streamOfPromotions() {
  var ref = FirebaseFirestore.instance.collection('promotions');
  return ref.snapshots().map((list) => list.docs.map((doc) => Promotion.fromFirestore(doc)).toList());
}
