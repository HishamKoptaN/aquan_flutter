// Firebase Exceptions
class FirebaseSignUpFailure {
  final String message;
  FirebaseSignUpFailure({
    required this.message,
  });
}

class EmailAlreadyInUseFailure extends FirebaseSignUpFailure {
  EmailAlreadyInUseFailure()
      : super(
          message: "البريد الإلكتروني مستخدم بالفعل",
        );
}

class InvalidEmailFailure extends FirebaseSignUpFailure {
  InvalidEmailFailure()
      : super(
          message: "البريد الإلكتروني غير صالح",
        );
}

class WeakPasswordFailure extends FirebaseSignUpFailure {
  WeakPasswordFailure()
      : super(
          message: "كلمة المرور ضعيفة جدًا",
        );
}

class ServerFailure extends FirebaseSignUpFailure {
  ServerFailure()
      : super(
          message: "حدث خطأ غير متوقع",
        );
}
