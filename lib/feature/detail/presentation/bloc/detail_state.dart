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
  final String error;

  const DetailState({
    this.status = DetailStatus.initial,
    this.comics = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [status, comics, error];

  DetailState copyWith({
    DetailStatus? status,
    List<DetailEntity>? comics,
    String? error,
  }) {
    return DetailState(
      status: status ?? this.status,
      comics: comics ?? this.comics,
      error: error ?? this.error,
    );
  }
}
