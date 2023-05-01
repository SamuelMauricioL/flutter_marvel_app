import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_route_event.dart';
part 'app_route_state.dart';

class AppRouteBloc extends Bloc<AppRouteEvent, AppRouteState> {
  AppRouteBloc() : super(const AppRouteState()) {
    on<ChangedTo>(_onPageChangedTo);
  }

  void _onPageChangedTo(
    ChangedTo event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        page: event.page,
        arguments: event.arguments,
      ),
    );
  }
}
