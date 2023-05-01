part of 'app_route_bloc.dart';

abstract class AppRouteEvent extends Equatable {
  const AppRouteEvent();

  @override
  List<Object?> get props => [];
}

class ChangedTo extends AppRouteEvent {
  const ChangedTo({
    required this.page,
    this.arguments = '',
  });

  final AppRoutes page;
  final String arguments;

  @override
  List<Object?> get props => [];
}
