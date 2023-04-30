import 'package:flutter_marvel_app/core/service/center_api.dart';
import 'package:flutter_marvel_app/core/service/endpoints.dart';
import 'package:flutter_marvel_app/feature/home/data/models/hero_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HeroModel>> getHeroes();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final CenterApi centerApi;

  HomeRemoteDataSourceImpl({required this.centerApi});

  @override
  Future<List<HeroModel>> getHeroes() async {
    final response = await centerApi.get(urlSpecific: Endpoints.getHeroes());

    if (!response.isSuccess) return [];

    final body = response.result['data']['results'];
    return heroesModelFromJson(body);
  }
}
