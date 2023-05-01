part of 'app_route_bloc.dart';

enum AppRoutes {
  home,
  detail,
  comics,
  events,
  series,
  stories,
}

class AppRouteState extends Equatable {
  const AppRouteState({
    this.page = AppRoutes.home,
    this.arguments = '',
  });

  final AppRoutes page;
  final Object arguments;

  AppRouteState copyWith({
    AppRoutes? page,
    Object? arguments,
  }) {
    return AppRouteState(
      page: page ?? this.page,
      arguments: arguments ?? this.arguments,
    );
  }

  @override
  List<Object> get props => [page, arguments];
}
