import 'dart:convert';

import 'package:flutter_marvel_app/feature/detail/data/models/price_model.dart';
import 'package:flutter_marvel_app/feature/home/data/models/thumbnail_model.dart';

List<DetailModel> detailsModelFromJson(dynamic str) => List<DetailModel>.from(
      (str as List<dynamic>).map(
        (dynamic x) {
          return DetailModel.fromJson(x);
        },
      ).toList(),
    );

String detailsModelToJson(List<DetailModel> data) => json.encode(
      List<dynamic>.from(
        data.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
    );

class DetailModel {
  final int id;
  final String title;
  final String description;
  final String resourceURI;
  final ThumbnailModel thumbnail;
  final List<PriceModel> prices;

  DetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.thumbnail,
    required this.prices,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      resourceURI: json['resourceURI'],
      thumbnail: json['thumbnail'] != null
          ? ThumbnailModel.fromJson(json['thumbnail'])
          : ThumbnailModel(
              path: 'https://i.redd.it/7z6qt753qe031',
              fileType: 'jpg',
            ),
      prices: json['prices'] != null
          ? pricesModelFromJson(json['prices'])
          : [PriceModel(type: '', price: 0)],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resourceURI': resourceURI,
      'thumbnail': thumbnail.toJson(),
      'prices': pricesModelToJson(prices),
    };
  }
}
