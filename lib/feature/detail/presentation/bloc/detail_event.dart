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
