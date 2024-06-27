import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'bloc/local_auth_bloc.dart';
import '../../app/home_page/view/dashboard.dart';
import 'bloc/local_auth_event.dart';
import 'bloc/local_auth_state.dart'; // تأكد من استيراد ملفات البلوك الخاصة بك

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BiometricBloc(LocalAuthentication())..add(BiometricAuthenticate()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<BiometricBloc, BiometricState>(
          listener: (context, state) {
            if (state is BiometricAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            } else if (state is BiometricError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is BiometricInitial || state is BiometricAuthenticated) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BiometricError) {
              return Center(child: Text('Authentication failed. Try again.'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
