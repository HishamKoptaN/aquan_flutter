import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/Helpers/storage.dart';
import '../controller/login_controller.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginController loginController = LoginController();
  LoginBloc() : super(LoginInitial()) {
    on<Login>(
      (event, emit) async {
        emit(LoginLoading());
        final Map<String, dynamic> response = await loginController.login(
          event.email,
          event.password,
        );
        if (response['status']) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String userJson = json.encode(response['user']);
          prefs.setString('user', userJson);
          Storage.setString(
            'auth_token',
            response['token'],
          );
          emit(
            AuthLogedInSuccessfully(),
          );
        } else {
          emit(
            LoginErrors(
              message: response['error'],
            ),
          );
        }
      },
    );
  }
}
