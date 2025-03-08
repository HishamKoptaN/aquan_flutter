import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../../core/widgets/toast_notifier.dart';
import '../home/home_view.dart';
import 'bloc/biometric_bloc.dart';
import 'bloc/biometric_event.dart';
import 'bloc/biometric_state.dart';

class BiometricView extends StatelessWidget {
  const BiometricView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BiometricBloc(LocalAuthentication())
        ..add(
          const BiometricEvent.authenticate(),
        ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<BiometricBloc, BiometricState>(
          listener: (context, state) {
            state.whenOrNull(
              authenticated: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigateBarView(),
                  ),
                  (route) => false,
                );
              },
              failure: (error) {
                ToastNotifier().showError(
                  context: context,
                  message: error ?? "t.error",
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              failure: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<BiometricBloc>().add(
                              const BiometricEvent.authenticate(),
                            );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
