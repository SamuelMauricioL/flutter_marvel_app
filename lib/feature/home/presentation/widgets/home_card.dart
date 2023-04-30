import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_card_scroll.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';

class HomeCard extends StatefulWidget {
  final List<HeroEntity> heroes;
  const HomeCard({required this.heroes, super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late List<String> imagesUrl;
  late List<String> heroesName;
  late double currentPage;
  late PageController controller;

  @override
  void initState() {
    imagesUrl = widget.heroes.map((h) => h.imageUrl).toList();
    heroesName = widget.heroes.map((h) => h.name).toList();
    currentPage = widget.heroes.length - 1.0;
    controller = PageController(initialPage: widget.heroes.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MarvelCardScroll(
          currentPage: currentPage,
          imagesUrl: imagesUrl,
          titles: heroesName,
        ),
        Positioned.fill(
          child: PageView.builder(
            itemCount: widget.heroes.length,
            controller: controller,
            reverse: true,
            itemBuilder: (context, index) => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}
