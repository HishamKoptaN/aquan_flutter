import '../models/user.dart';

class UserSingleton {
  User? _user;
  static final UserSingleton _instance = UserSingleton._internal();
  UserSingleton._internal();
  static UserSingleton get instance => _instance;
  User? get user => _user;
  set user(User? user) {
    _user = user;
  }

  void clearUser() {
    _user = null;
  }
}
