// ignore_for_file: constant_identifier_names
import 'package:flutter_marvel_app/core/exception/exceptions.dart';
import 'package:flutter_marvel_app/core/storage/storage.dart';
import 'package:flutter_marvel_app/feature/detail/data/models/detail_model.dart';

const CACHED_COMICS = 'CACHED_COMICS';
const CACHED_EVENTS = 'CACHED_EVENTS';

abstract class DetailLocalDataSource {
  void cacheComics(List<DetailModel> heroes);
  Future<List<DetailModel>> getLastComics();

  void cacheEvents(List<DetailModel> heroes);
  Future<List<DetailModel>> getLastEvents();
}

class DetailLocalDataSourceImpl extends DetailLocalDataSource {
  DetailLocalDataSourceImpl({required this.storage});

  final Storage storage;

  @override
  void cacheComics(List<DetailModel> heroes) =>
      _cacheDetail(CACHED_COMICS, heroes);

  @override
  Future<List<DetailModel>> getLastComics() async =>
      _getLastDetail(CACHED_COMICS);

  @override
  void cacheEvents(List<DetailModel> heroes) =>
      _cacheDetail(CACHED_EVENTS, heroes);

  @override
  Future<List<DetailModel>> getLastEvents() async =>
      _getLastDetail(CACHED_EVENTS);

  void _cacheDetail(String key, List<DetailModel> heroes) =>
      storage.write(key, detailsModelToJson(heroes));

  Future<List<DetailModel>> _getLastDetail(String key) async {
    try {
      final list = await storage.read(key);
      return Future.value(detailsModelFromJson(list!));
    } catch (e) {
      throw CacheException();
    }
  }
}
