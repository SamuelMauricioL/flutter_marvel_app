import 'package:flutter_marvel_app/feature/home/data/models/hero_model.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';

extension HeroX on HeroModel {
  HeroEntity toEntity() => HeroEntity(
        id: id,
        name: name,
        description: description,
        modified: modified,
        imageUrl: '${thumbnail.path}.${thumbnail.fileType}',
      );
}
