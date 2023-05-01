import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/marvel_text_style.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_network_image.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';

void detailModalBottonSheetComic(BuildContext context, DetailEntity detail) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) {
      return SizedBox(
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 700,
              child: MarvelNetworkImage(imageUrl: detail.imageUrl),
            ),
            Text(detail.title, style: MarvelTextStyle.subtitle2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Text(
                    detail.description,
                    maxLines: 4,
                    style: MarvelTextStyle.paragraph,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Precio', style: MarvelTextStyle.subtitle2),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$${detail.price}',
                      style: MarvelTextStyle.paragraph,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
