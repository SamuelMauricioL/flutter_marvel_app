import 'package:flutter_marvel_app/core/exception/exceptions.dart';
import 'package:flutter_marvel_app/core/exception/failures.dart';
import 'package:flutter_marvel_app/feature/detail/data/datasource/detail_local_data_source.dart';
import 'package:flutter_marvel_app/feature/detail/data/datasource/detail_remote_data_source.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';
import 'package:flutter_marvel_app/feature/detail/data/mappers/detail_to_entity_mapper.dart';
import 'package:oxidized/oxidized.dart';

abstract class DetailRepository {
  Future<Result<List<DetailEntity>, Failure>> getComics(String id);
  Future<Result<List<DetailEntity>, Failure>> getEvents(String id);
}

class DetailRepositoryImpl extends DetailRepository {
  final DetailRemoteDataSource remoteDataSource;
  final DetailLocalDataSource localDataSource;

  DetailRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<List<DetailEntity>, Failure>> getComics(String id) async {
    try {
      final data = await remoteDataSource.getComics(id);
      localDataSource.cacheComics(data);
      return Result.ok(data.map((m) => m.toEntity()).toList());
    } on CacheException catch (_) {
      return Result.err(CacheFailure());
    }
  }

  @override
  Future<Result<List<DetailEntity>, Failure>> getEvents(String id) async {
    try {
      final data = await remoteDataSource.getEvents(id);
      localDataSource.cacheEvents(data);
      return Result.ok(data.map((m) => m.toEntity()).toList());
    } on CacheException catch (_) {
      return Result.err(CacheFailure());
    }
  }
}
