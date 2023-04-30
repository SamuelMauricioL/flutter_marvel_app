part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<HeroEntity> heroes;
  final String error;

  const HomeState({
    this.status = HomeStatus.initial,
    this.heroes = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [status, heroes, error];

  HomeState copyWith({
    HomeStatus? status,
    List<HeroEntity>? heroes,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      heroes: heroes ?? this.heroes,
      error: error ?? this.error,
    );
  }
}
