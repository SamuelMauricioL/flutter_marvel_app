part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetListHeroes extends HomeEvent {
  const GetListHeroes();

  @override
  List<Object> get props => [];
}
