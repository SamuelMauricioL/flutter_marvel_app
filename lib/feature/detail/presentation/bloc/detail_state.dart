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
  final List<DetailEntity> stories;
  final String error;

  const DetailState({
    this.status = DetailStatus.initial,
    this.comics = const [],
    this.events = const [],
    this.series = const [],
    this.stories = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [status, comics, events, series, stories, error];

  DetailState copyWith({
    DetailStatus? status,
    List<DetailEntity>? comics,
    List<DetailEntity>? events,
    List<DetailEntity>? series,
    List<DetailEntity>? stories,
    String? error,
  }) {
    return DetailState(
      status: status ?? this.status,
      comics: comics ?? this.comics,
      events: events ?? this.events,
      series: series ?? this.series,
      stories: stories ?? this.stories,
      error: error ?? this.error,
    );
  }
}
