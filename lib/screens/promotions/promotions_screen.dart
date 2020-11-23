import 'package:flutter/material.dart';
import 'package:my_pregnancy/constants/colors.dart';
import 'package:my_pregnancy/models/promotion.dart';
import 'package:my_pregnancy/screens/promotions/promotions_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            color: kLightPinkColor,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Promocje",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          PromotionsList()
        ]),
      ),
    );
  }
}

class PromotionsList extends StatelessWidget {
  final PromotionsController _promotionsController = PromotionsController();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _promotionsController.getAllPromotions(),
      builder: (context, snapshot) {
        List<Promotion> promotions = snapshot.data;
        if (promotions == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Expanded(
          child: Container(
            color: kLightPinkColor,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: promotions.length,
              itemBuilder: (BuildContext context, int index) {
                return PromotionListItem(
                    title: promotions[index].title,
                    description: promotions[index].description,
                    image: promotions[index].image,
                    url: promotions[index].url);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
                thickness: 5,
                indent: 20,
                endIndent: 20,
                color: Colors.white30,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PromotionListItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String url;

  const PromotionListItem(
      {Key key, this.title, this.description, this.image, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () => _launchURL(url),
          child: Container(
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(
                          description,
                          maxLines: 3,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image: NetworkImage(image != null
                                  ? image
                                  : 'https://cdn.bike24.net/i/mb/fc/57/b5/markenshop-rausverkauf-logo-228x228-7752.png')),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(final url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
