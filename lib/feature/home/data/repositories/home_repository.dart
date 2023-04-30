import 'package:flutter_marvel_app/core/exception/exceptions.dart';
import 'package:flutter_marvel_app/core/exception/failures.dart';
import 'package:flutter_marvel_app/feature/home/data/datasources/home_local_data_source.dart';
import 'package:flutter_marvel_app/feature/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_marvel_app/feature/home/data/mappers/hero_to_entity_mapper.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';
import 'package:oxidized/oxidized.dart';

abstract class HomeRepository {
  Future<Result<List<HeroEntity>, Failure>> getHeroes();
}

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<List<HeroEntity>, Failure>> getHeroes() async {
    try {
      final data = await remoteDataSource.getHeroes();
      localDataSource.cacheHeroes(data);
      return Result.ok(data.map((m) => m.toEntity()).toList());
    } on CacheException catch (_) {
      return Result.err(CacheFailure());
    }
  }
}
