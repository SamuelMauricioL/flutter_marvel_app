// ignore_for_file: constant_identifier_names
import 'package:flutter_marvel_app/core/exception/exceptions.dart';
import 'package:flutter_marvel_app/core/storage/storage.dart';
import 'package:flutter_marvel_app/feature/home/data/models/hero_model.dart';

const CACHED_HEROES = 'CACHED_HEROES';

abstract class HomeLocalDataSource {
  void cacheHeroes(List<HeroModel> heroes);
  Future<List<HeroModel>> getLastHeroes();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  HomeLocalDataSourceImpl({required this.storage});

  final Storage storage;

  @override
  void cacheHeroes(List<HeroModel> heroes) =>
      storage.write(CACHED_HEROES, heroesModelToJson(heroes));

  @override
  Future<List<HeroModel>> getLastHeroes() async {
    try {
      final list = await storage.read(CACHED_HEROES);
      return Future.value(heroesModelFromJson(list!));
    } catch (e) {
      throw CacheException();
    }
  }
}
