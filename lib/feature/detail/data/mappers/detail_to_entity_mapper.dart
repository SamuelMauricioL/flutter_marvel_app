import 'package:flutter_marvel_app/feature/detail/data/models/detail_model.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';

extension DetailX on DetailModel {
  DetailEntity toEntity() => DetailEntity(
        id: id,
        title: title,
        description: description,
        resourceURI: resourceURI,
        imageUrl: '${thumbnail.path}.${thumbnail.fileType}',
        price: prices.first.price,
      );
}
