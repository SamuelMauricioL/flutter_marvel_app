import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/palette.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_network_image.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.sliverAppHeight,
    required this.isShrink,
    required this.hero,
  });

  final double sliverAppHeight;
  final bool isShrink;
  final HeroEntity hero;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: sliverAppHeight,
      pinned: true,
      title: Visibility(
        visible: isShrink,
        child: Text(
          hero.name,
          maxLines: 1,
        ),
      ),
      backgroundColor: Palette.primary,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Visibility(
          visible: !isShrink,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Palette.primary.withAlpha(200),
              backgroundBlendMode: BlendMode.darken,
            ),
            child: Text(hero.name),
          ),
        ),
        titlePadding: const EdgeInsets.only(left: 40, bottom: 15, right: 20),
        background: MarvelNetworkImage(
          imageUrl: hero.imageUrl,
        ),
      ),
    );
  }
}
