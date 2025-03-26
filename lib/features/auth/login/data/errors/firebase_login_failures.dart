abstract class FirebaseSignInFailure {
  final String message;
  FirebaseSignInFailure({
    required this.message,
  });
}

class UserNotFoundFailure extends FirebaseSignInFailure {
  UserNotFoundFailure()
      : super(
          message: "المستخدم غير موجود",
        );
}

class InvalidCredentialFailure extends FirebaseSignInFailure {
  InvalidCredentialFailure()
      : super(
          message: "البريد الالكتروني او كلمة المرور غير صحيحة",
        );
}

class WrongPasswordFailure extends FirebaseSignInFailure {
  WrongPasswordFailure()
      : super(
          message: "كلمة المرور غير صحيحة",
        );
}

class UserDisabledFailure extends FirebaseSignInFailure {
  UserDisabledFailure()
      : super(
          message: "تم تعطيل الحساب",
        );
}

class LoginServerFailure extends FirebaseSignInFailure {
  LoginServerFailure()
      : super(
          message: "حدث خطأ غير متوقع أثناء تسجيل الدخول",
        );
}
