import 'package:aquan/features/plans/data/model/plan_model.dart';

class PlansSingleton {
  List<Plan>? _plans;
  static final PlansSingleton _instance = PlansSingleton._internal();
  PlansSingleton._internal();
  static PlansSingleton get instance => _instance;
  List<Plan>? get get => _plans;

  Future<void> load({
    required List<Plan>? plans,
  }) async {
    _instance._plans = plans;
  }

  set plans(List<Plan>? plans) {
    _plans = plans;
  }

  void clearUser() {
    _plans = null;
  }
}
