import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart'; // Add this line

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: VerifyCodeScreenTwo(),
      ),
    );
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SendEmailVerificationCode) {
      yield AuthLoading();
      try {
        final Map<String, dynamic> response =
            await YourAPIClient().sendVerifyEmail(event.email);
        if (response['status'] == true) {
          yield AuthSuccess(message: 'Verification code sent successfully.');
        } else {
          yield AuthFailure(error: response['error']);
        }
      } catch (e) {
        yield AuthFailure(error: e.toString());
      }
    }
  }
}

class VerifyCodeScreenTwo extends StatelessWidget {
  // تحديد البريد الإلكتروني مباشرة
  final String email = "heshamkoptan@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resend Verification '),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // عرض مؤشر تحميل
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is AuthSuccess) {
            // إخفاء مؤشر التحميل وعرض رسالة النجاح
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthFailure) {
            // إخفاء مؤشر التحميل وعرض رسالة الخطأ
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // لا نحتاج إلى حقل إدخال هنا
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // إرسال البريد الإلكتروني المحدد مباشرة عند الضغط على الزر
                  context
                      .read<AuthBloc>()
                      .add(SendEmailVerificationCode(email));
                },
                child: Text('Send Verification Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YourAPIClient {
  Future<Map<String, dynamic>> sendVerifyEmail(String email) async {
    var url = Uri.parse('https://dash.aquan.website/api/resendcode');
    var headers = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization':
          'Bearer 12|TGgrM4JHy9R3oVQk5eqVGwoU7r11o55EusdwMNpP19b183c1',
      'Content-Type': 'application/json',
    };
    var body = {
      "email": email,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to send verification email');
    }
  }
}

abstract class AuthEvent {}

class SendEmailVerificationCode extends AuthEvent {
  final String email;

  SendEmailVerificationCode(this.email);
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess({required this.message});
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
