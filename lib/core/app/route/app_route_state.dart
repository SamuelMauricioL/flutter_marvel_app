part of 'app_route_bloc.dart';

enum AppRoutes {
  home,
  comics,
  events,
  series,
  stories,
}

class AppRouteState extends Equatable {
  const AppRouteState({
    this.page = AppRoutes.home,
  });

  final AppRoutes page;

  AppRouteState copyWith({
    AppRoutes? page,
  }) {
    return AppRouteState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
