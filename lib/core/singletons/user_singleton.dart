import '../models/user.dart';

class UserSingleton {
  static final UserSingleton _instance = UserSingleton._internal();
  UserSingleton._internal();
  static UserSingleton get instance => _instance;
  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? user) {
    _user = user;
  }

  void clearUser() {
    _user = null;
  }
}
