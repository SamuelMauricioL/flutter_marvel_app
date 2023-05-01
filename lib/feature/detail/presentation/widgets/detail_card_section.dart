import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/marvel_text_style.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_card.dart';
import 'package:flutter_marvel_app/core/widgets/marvel_network_image.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';
import 'package:flutter_marvel_app/feature/detail/presentation/widgets/detail_modal_bottom_sheet_comic.dart';

class DetailCardSection extends StatelessWidget {
  final String title;
  final List<DetailEntity> detail;

  const DetailCardSection({
    required this.title,
    required this.detail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return detail.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: MarvelTextStyle.subtitle),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: detail.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => detailModalBottonSheetComic(
                            context,
                            detail[i],
                          ),
                          child: MarvelCard(
                            aspectRatio: 9.0 / 16.0,
                            borderRadiusCircular: 10,
                            child: MarvelNetworkImage(
                              imageUrl: detail[i].imageUrl,
                            ),
                          ),
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
