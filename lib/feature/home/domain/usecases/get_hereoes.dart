import 'package:flutter_marvel_app/core/exception/failures.dart';
import 'package:flutter_marvel_app/feature/home/data/repositories/home_repository.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';
import 'package:oxidized/oxidized.dart';

class GetHeroesUseCase {
  final HomeRepository repository;

  GetHeroesUseCase({
    required this.repository,
  });

  Future<Result<List<HeroEntity>, Failure>> call() {
    return repository.getHeroes();
  }
}
