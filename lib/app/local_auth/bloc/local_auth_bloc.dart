import 'package:aquan/app/local_auth/bloc/local_auth_event.dart';
import 'package:aquan/app/local_auth/bloc/local_auth_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final LocalAuthentication auth;

  BiometricBloc(this.auth) : super(BiometricInitial()) {
    on<BiometricAuthenticate>(_onAuthenticate);
  }

  Future<void> _onAuthenticate(
      BiometricAuthenticate event, Emitter<BiometricState> emit) async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        emit(BiometricAuthenticated());
      } else {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('password');
        emit(BiometricError('Authentication failed'));
      }
    } on PlatformException catch (e) {
      emit(BiometricError('An error occurred: ${e.message}'));
    }
  }
}
