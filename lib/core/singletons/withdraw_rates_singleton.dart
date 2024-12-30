import '../../features/withdraw/data/model/withdraw_rates_res_model.dart';

class WithdrawRatesResSingleton {
  WithdrawRatesResModel? _withdrawRatesResModel;
  static final WithdrawRatesResSingleton _instance =
      WithdrawRatesResSingleton._internal();
  WithdrawRatesResSingleton._internal();
  static WithdrawRatesResSingleton get instance => _instance;
  WithdrawRatesResModel? get withdrawRatesResModel => _withdrawRatesResModel;
  set withdrawRatesResModel(WithdrawRatesResModel? withdrawRatesResModel) {
    _withdrawRatesResModel = withdrawRatesResModel;
  }

  void clearToken() {
    _withdrawRatesResModel = null;
  }
}
