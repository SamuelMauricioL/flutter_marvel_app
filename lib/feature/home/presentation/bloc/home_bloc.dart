import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_marvel_app/feature/home/domain/entities/hero_entity.dart';
import 'package:flutter_marvel_app/feature/home/domain/usecases/get_hereoes.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHeroesUseCase getHeroesUseCase;

  HomeBloc(this.getHeroesUseCase) : super(const HomeState()) {
    on<GetListHeroes>(_getListHeroes);
  }

  Future<void> _getListHeroes(
    GetListHeroes event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final res = await getHeroesUseCase();

    res.when(
      ok: (heroes) {
        emit(state.copyWith(status: HomeStatus.loaded, heroes: heroes));
      },
      err: (failure) {
        emit(state.copyWith(
          status: HomeStatus.error,
          error: failure.toString(),
        ));
      },
    );
  }
}
