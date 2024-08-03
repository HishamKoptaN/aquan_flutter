import 'package:aquan/app/Auth/controller/user_controller.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/bloc/profile_bloc.dart';
import '../../../profile/model/profile_model.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserController _controller = UserController();

  UserBloc() : super(UserInitial()) {
    on<GetReferals>(
      (event, emit) async {
        Map<String, dynamic> data = await _controller.getReferals();

        if (data['status']) {
          emit(ReferalsDone(users: data['users'], user: data['user']));
        } else {
          emit(
            UserError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
