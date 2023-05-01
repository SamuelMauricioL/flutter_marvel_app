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
  final String error;

  const DetailState({
    this.status = DetailStatus.initial,
    this.comics = const [],
    this.events = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [status, comics, events, error];

  DetailState copyWith({
    DetailStatus? status,
    List<DetailEntity>? comics,
    List<DetailEntity>? events,
    String? error,
  }) {
    return DetailState(
      status: status ?? this.status,
      comics: comics ?? this.comics,
      events: events ?? this.events,
      error: error ?? this.error,
    );
  }
}
