import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'biometric_event.dart';
import 'biometric_state.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final LocalAuthentication auth;

  BiometricBloc(this.auth) : super(const BiometricState.initial()) {
    on<BiometricEvent>(
      (event, emit) async {
        await event.when(
          authenticate: () async {
            try {
              bool authenticated = await auth.authenticate(
                localizedReason: 'Scan your fingerprint to authenticate',
                options: const AuthenticationOptions(
                  stickyAuth: true,
                  biometricOnly: true,
                ),
              );

              if (authenticated) {
                emit(const BiometricState.authenticated());
              } else {
                emit(const BiometricState.failure(
                  error: 'Authentication failed.',
                ));
              }
            } on PlatformException catch (e) {
              emit(BiometricState.failure(
                error: e.toString(),
              ));
            }
          },
        );
      },
    );
  }
}
