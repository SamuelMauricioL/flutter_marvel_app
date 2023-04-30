import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_marvel_app/core/utils/constants.dart';

class MarvelCardScroll extends StatelessWidget {
  final List<String> imagesUrl;
  final List<String> titles;
  final double currentPage;
  final double padding;
  final double verticalInset;
  const MarvelCardScroll({
    required this.imagesUrl,
    required this.titles,
    required this.currentPage,
    this.padding = 20.0,
    this.verticalInset = 20.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double cardAspectRatio = 12.0 / 24.0;
    const double widgetAspectRatio = cardAspectRatio * 1.2;

    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          double width = contraints.maxWidth;
          double height = contraints.maxHeight;

          double safeWidth = width - 2 * padding;
          double safeHeight = height - 2 * padding;

          double heightOfPrimaryCard = safeHeight;
          double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          double primaryCardLeft = safeWidth - widthOfPrimaryCard;
          double horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < imagesUrl.length; i++) {
            double delta = i - currentPage;
            bool isOnRight = delta > 0;

            double start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            Positioned cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.network(imagesUrl[i], fit: BoxFit.cover),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(titles[i],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: "SF-Pro-Text-Regular")),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  bottom: 12.0,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 22.0,
                                    vertical: 6.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: const Text(
                                    "Watch Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}
