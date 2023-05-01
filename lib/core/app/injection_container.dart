import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_marvel_app/core/service/center_api.dart';
import 'package:flutter_marvel_app/core/storage/storage.dart';
import 'package:flutter_marvel_app/feature/detail/data/datasource/detail_local_data_source.dart';
import 'package:flutter_marvel_app/feature/detail/data/datasource/detail_remote_data_source.dart';
import 'package:flutter_marvel_app/feature/detail/data/repositories/detail_repository.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_comics.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_events.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_series.dart';
import 'package:flutter_marvel_app/feature/detail/presentation/bloc/detail_bloc.dart';
import 'package:flutter_marvel_app/feature/home/data/datasources/home_local_data_source.dart';
import 'package:flutter_marvel_app/feature/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_marvel_app/feature/home/data/repositories/home_repository.dart';
import 'package:flutter_marvel_app/feature/home/domain/usecases/get_hereoes.dart';
import 'package:flutter_marvel_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

init() {
  //=======================
  // Blocs
  //=======================
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => DetailBloc(sl(), sl(), sl()));

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => GetHeroesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetComicsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetEventsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSeriesUseCase(repository: sl()));

  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<DetailRepository>(() =>
      DetailRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(storage: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(centerApi: sl()));
  sl.registerLazySingleton<DetailLocalDataSource>(
      () => DetailLocalDataSourceImpl(storage: sl()));
  sl.registerLazySingleton<DetailRemoteDataSource>(
      () => DetailRemoteDataSourceImpl(centerApi: sl()));

  //=======================
  // Network
  //=======================
  sl.registerLazySingleton<CenterApi>(() => CenterApi());

  //=======================
  // Storage
  //=======================
  sl.registerLazySingleton<Storage>(() => Storage());

  //=======================
  // Services
  //=======================
  sl.registerLazySingleton<CacheManager>(() => DefaultCacheManager());
}
