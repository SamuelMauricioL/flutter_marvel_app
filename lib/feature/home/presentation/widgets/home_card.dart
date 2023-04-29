import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/utils/constants.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_card_scroll.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  double currentPage = images.length - 1.0;
  PageController controller = PageController(initialPage: images.length - 1);

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    CustomIcons.menu,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const Text("Marvel Movie",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontFamily: "Calibre-Semibold",
                  letterSpacing: 1.0,
                )),
            // Row(
            //   children: <Widget>[
            //     Container(
            //       decoration: BoxDecoration(
            //         color: const Color(0xFFff6e6e),
            //         borderRadius: BorderRadius.circular(20.0),
            //       ),
            //       child: const Center(
            //         child: Padding(
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
            //           child:
            //               Text("Movies", style: TextStyle(color: Colors.white)),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 15.0,
            //     ),
            //     const Text("500k+ Reviews",
            //         style: TextStyle(color: Colors.blueAccent))
            //   ],
            // ),
            Stack(
              children: <Widget>[
                MarvelCardScroll(currentPage: currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}
