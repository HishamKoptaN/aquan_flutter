import 'package:equatable/equatable.dart';

abstract class FirebaseFailure extends Equatable {}

class OfflineFailure extends FirebaseFailure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends FirebaseFailure {
  @override
  List<Object?> get props => [];
}

class WeekPassFailure extends FirebaseFailure {
  @override
  List<Object?> get props => [];
}

class ExistedAccountFailure extends FirebaseFailure {
  @override
  List<Object?> get props => [];
}

class NoUserFailure extends FirebaseFailure {
  @override
  List<Object?> get props => [];
}

class WrongPasswordFailure extends FirebaseFailure {
  @override
  List<Object?> get props => [];
}

class UnmatchedPassFailure extends FirebaseFailure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NotLoggedInFailure extends FirebaseFailure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmailVerifiedFailure extends FirebaseFailure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TooManyRequestsFailure extends FirebaseFailure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
