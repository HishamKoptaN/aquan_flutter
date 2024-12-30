import '../../features/trans/data/model/trans_model.dart';

class TransSingleton {
  static final TransSingleton _instance = TransSingleton._internal();
  TransSingleton._internal();
  static TransSingleton get instance => _instance;
  List<Trans>? _trans;
  List<Trans>? get trans => _trans;
  set trans(List<Trans>? trans) {
    _trans = trans;
  }

  void clearUser() {
    _trans = null;
  }
}
