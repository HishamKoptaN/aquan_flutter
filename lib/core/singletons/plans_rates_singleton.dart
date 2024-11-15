import '../../features/Plans/data/model/plan_rate.dart';

class PlanRateSingleton {
  PlanRate? _planRate;
  static final PlanRateSingleton _instance = PlanRateSingleton._internal();
  PlanRateSingleton._internal();
  static PlanRateSingleton get instance => _instance;
  PlanRate? get get => _planRate;

  Future<void> load({
    required PlanRate? plans,
  }) async {
    _instance._planRate = plans;
  }

  set set(PlanRate planRate) {
    _planRate = planRate;
  }

  void clearUser() {
    _planRate = null;
  }
}
