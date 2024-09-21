import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/controller/login_controller.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginController _controller = LoginController();

  UserBloc() : super(UserInitial()) {}
}
