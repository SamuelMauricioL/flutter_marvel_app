part of 'app_route_bloc.dart';

abstract class AppRouteEvent extends Equatable {
  const AppRouteEvent();

  @override
  List<Object?> get props => [];
}

class ChangedTo extends AppRouteEvent {
  const ChangedTo({
    required this.page,
  });

  final AppRoutes page;

  @override
  List<Object?> get props => [];
}
