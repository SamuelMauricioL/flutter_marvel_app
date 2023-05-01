import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_marvel_app/feature/detail/domain/entities/detail_entity.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_comics.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_events.dart';
import 'package:flutter_marvel_app/feature/detail/domain/usecases/get_series.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetComicsUseCase getComicsUseCase;
  final GetEventsUseCase getEventsUseCase;
  final GetSeriesUseCase getSeriesUseCase;

  DetailBloc(
    this.getComicsUseCase,
    this.getEventsUseCase,
    this.getSeriesUseCase,
  ) : super(const DetailState()) {
    on<GetComics>(_getComics);
    on<GetEvents>(_getEvents);
    on<GetSeries>(_getSeries);
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

  Future<void> _getEvents(
    GetEvents event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(status: DetailStatus.loading));
    final res = await getEventsUseCase(event.id);

    res.when(
      ok: (events) {
        emit(state.copyWith(status: DetailStatus.loaded, events: events));
      },
      err: (failure) {
        emit(state.copyWith(
          status: DetailStatus.error,
          error: failure.toString(),
        ));
      },
    );
  }

  Future<void> _getSeries(
    GetSeries event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(status: DetailStatus.loading));
    final res = await getSeriesUseCase(event.id);

    res.when(
      ok: (series) {
        emit(state.copyWith(status: DetailStatus.loaded, series: series));
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
