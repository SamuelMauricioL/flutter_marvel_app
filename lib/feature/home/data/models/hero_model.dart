import 'dart:convert';

import 'package:flutter_marvel_app/feature/home/data/models/thumbnail_model.dart';

List<HeroModel> heroesModelFromJson(dynamic str) => List<HeroModel>.from(
      (str as List<dynamic>).map(
        (dynamic x) {
          return HeroModel.fromJson(x);
        },
      ).toList(),
    );

String heroesModelToJson(List<HeroModel> data) => json.encode(
      List<dynamic>.from(
        data.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
    );

class HeroModel {
  final int id;
  final String name;
  final String description;
  final String modified;
  final ThumbnailModel thumbnail;
  final String resourceUri;

  HeroModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) => HeroModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: ThumbnailModel.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
      };
}
