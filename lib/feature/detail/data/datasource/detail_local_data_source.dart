// ignore_for_file: constant_identifier_names
import 'package:flutter_marvel_app/core/exception/exceptions.dart';
import 'package:flutter_marvel_app/core/storage/storage.dart';
import 'package:flutter_marvel_app/feature/detail/data/models/detail_model.dart';

const CACHED_COMICS = 'CACHED_COMICS';

abstract class DetailLocalDataSource {
  void cacheComics(List<DetailModel> heroes);
  Future<List<DetailModel>> getLastComics();
}

class DetailLocalDataSourceImpl extends DetailLocalDataSource {
  DetailLocalDataSourceImpl({required this.storage});

  final Storage storage;

  @override
  void cacheComics(List<DetailModel> heroes) =>
      storage.write(CACHED_COMICS, detailsModelToJson(heroes));

  @override
  Future<List<DetailModel>> getLastComics() async {
    try {
      final list = await storage.read(CACHED_COMICS);
      return Future.value(detailsModelFromJson(list!));
    } catch (e) {
      throw CacheException();
    }
  }
}
