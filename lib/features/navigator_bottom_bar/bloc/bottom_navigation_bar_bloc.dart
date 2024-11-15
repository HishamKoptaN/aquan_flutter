import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Auth/login/controller/login_controller.dart';
import '../../Auth/sign_up/data/controller/sign_up_controller.dart';
import 'bottom_navigation_bar_event.dart';
import 'bottom_navigation_bar_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final SignUpController _authController = SignUpController();
  final LoginController _userController = LoginController();
  NavigationBloc() : super(NavigationInitial()) {
    on<ChangePageEvent>(
      (event, emit) {
        emit(NavigationPageChanged(
          event.pageIndex,
        ));
      },
    );
  }
}
