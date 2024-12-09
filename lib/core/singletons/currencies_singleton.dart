import '../models/currency.dart';

class CurrenciesSingleton {
  List<Currency>? _currencies;
  static final CurrenciesSingleton _instance = CurrenciesSingleton._internal();
  CurrenciesSingleton._internal();
  static CurrenciesSingleton get instance => _instance;
  List<Currency>? get get => _currencies;

  Future<void> load({
    required List<Currency>? currencies,
  }) async {
    _instance._currencies = currencies;
  }

  set currencies(List<Currency>? currencies) {
    _currencies = currencies;
  }

  void clearUser() {
    _currencies = null;
  }
}
