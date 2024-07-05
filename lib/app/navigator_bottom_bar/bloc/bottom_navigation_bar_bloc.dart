import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Auth/controller/user_controller.dart';
import '../../sign_up/controller/auth_controller.dart';
import 'bottom_navigation_bar_event.dart';
import 'bottom_navigation_bar_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();
  NavigationBloc() : super(NavigationInitial()) {
    on<ChangePageEvent>(
      (event, emit) {
        emit(NavigationPageChanged(event.pageIndex));
      },
    );
  }
}
