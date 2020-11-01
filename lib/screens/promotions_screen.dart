import 'package:flutter/material.dart';
import 'package:my_pregnancy/constants/colors.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(color: kLightPinkColor),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Promocje",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: _myListView(context),
          ),
        ],
      ),
    );
  }
}

Widget _myListView(BuildContext context) {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  return ListView.separated(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return PromotionListItem(
          title: entries[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),

  );
}

class PromotionListItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const PromotionListItem({Key key, this.title, this.description, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Entry ${title}', style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 15)),
                Text('bardzo długi opis jakiegiejś promocji z której nawet nikt nigdy nie skorzysta')
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [Text("<<image>>")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
