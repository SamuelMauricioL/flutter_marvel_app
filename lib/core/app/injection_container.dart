import 'package:flutter_marvel_app/core/service/center_api.dart';
import 'package:flutter_marvel_app/core/storage/storage.dart';
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

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => GetHeroesUseCase(repository: sl()));

  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(centerApi: sl()));
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(storage: sl()));

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
}
