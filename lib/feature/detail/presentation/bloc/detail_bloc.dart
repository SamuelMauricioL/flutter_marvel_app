import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_comics.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetComicsUseCase getComicsUseCase;

  DetailBloc(this.getComicsUseCase) : super(const DetailState()) {
    on<GetComics>(_getComics);
  }

  Future<void> _getComics(
    GetComics event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(status: DetailStatus.loading));
    final res = await getComicsUseCase(event.id);

    res.when(
      ok: (comics) {
        emit(state.copyWith(status: DetailStatus.loaded, comics: comics));
      },
      err: (failure) {
        emit(state.copyWith(
          status: DetailStatus.error,
          error: failure.toString(),
        ));
      },
    );
  }
}
