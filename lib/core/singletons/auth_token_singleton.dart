class AuthTokenStorage {
  static final AuthTokenStorage _instance = AuthTokenStorage._internal();
  factory AuthTokenStorage() => _instance;
  AuthTokenStorage._internal();
  String? _authToken;
  String? get authToken => _authToken;
  set authToken(String? token) {
    _authToken = token;
  }

  void clearToken() {
    _authToken = null;
  }
}
