part of 'detail_bloc.dart';

enum DetailStatus {
  initial,
  loading,
  loaded,
  error,
}

class DetailState extends Equatable {
  final DetailStatus status;
  final List<DetailEntity> comics;
  final List<DetailEntity> events;
  final List<DetailEntity> series;
  final String error;

  const DetailState({
    this.status = DetailStatus.initial,
    this.comics = const [],
    this.events = const [],
    this.series = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [status, comics, events, series, error];

  DetailState copyWith({
    DetailStatus? status,
    List<DetailEntity>? comics,
    List<DetailEntity>? events,
    List<DetailEntity>? series,
    String? error,
  }) {
    return DetailState(
      status: status ?? this.status,
      comics: comics ?? this.comics,
      events: events ?? this.events,
      series: series ?? this.series,
      error: error ?? this.error,
    );
  }
}
