part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetComics extends DetailEvent {
  const GetComics(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class GetEvents extends DetailEvent {
  const GetEvents(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class GetSeries extends DetailEvent {
  const GetSeries(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class GetStories extends DetailEvent {
  const GetStories(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
