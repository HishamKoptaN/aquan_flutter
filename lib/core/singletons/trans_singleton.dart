import '../../features/trans/data/model/trans_model.dart';

class TransDataStorage {
  static final TransDataStorage _instance = TransDataStorage._internal();

  List<Trans>? _trans;
  // Private constructor to prevent multiple instances
  TransDataStorage._internal();

  // Singleton instance getter
  factory TransDataStorage() => _instance;

  // Getter for user
  List<Trans>? get trans => _trans;

  // Setter for user
  set trans(List<Trans>? trans) {
    _trans = trans;
  }

  // Method to clear stored user
  void clearUser() {
    _trans = null;
  }

  // Method to get the user or throw an error if not available
  List<Trans> getTrans() {
    if (_trans == null) {
      throw Exception("No user data available");
    }
    return _trans!;
  }
}
