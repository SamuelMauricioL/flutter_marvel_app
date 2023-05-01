import 'package:flutter_marvel_app/core/exception/failures.dart';
import 'package:flutter_marvel_app/feature/detail/data/repositories/detail_repository.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';
import 'package:oxidized/oxidized.dart';

class GetSeriesUseCase {
  final DetailRepository repository;

  GetSeriesUseCase({
    required this.repository,
  });

  Future<Result<List<DetailEntity>, Failure>> call(String id) {
    return repository.getSeries(id);
  }
}
