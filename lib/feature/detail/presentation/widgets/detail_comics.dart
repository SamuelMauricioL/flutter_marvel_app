import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/marvel_text_style.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_card.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_network_image.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';

class DetailComics extends StatelessWidget {
  final List<DetailEntity> comics;
  const DetailComics({required this.comics, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Comics', style: MarvelTextStyle.subtitle),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: comics.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Row(
                children: [
                  // SizedBox(
                  //   width: 100,
                  //   height: 150,
                  //   child: MarvelHoverEfect(
                  //     child: MarvelCard(
                  //       aspectRatio: 9.0 / 16.0,
                  //       borderRadiusCircular: 10,
                  //       child: MarvelNetworkImage(imageUrl: comics[i].imageUrl),
                  //     ),
                  //   ),
                  // ),
                  MarvelCard(
                    aspectRatio: 9.0 / 16.0,
                    borderRadiusCircular: 10,
                    child: MarvelNetworkImage(imageUrl: comics[i].imageUrl),
                  ),
                  const SizedBox(width: 15),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
