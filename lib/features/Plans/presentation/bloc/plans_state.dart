import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/model/plan_rate.dart';
part 'plans_state.freezed.dart';

@freezed
class PlansState with _$PlansState {
  const factory PlansState.initial() = _Initial;
  const factory PlansState.loading() = _Loading;
  const factory PlansState.plansLoaded() = _PlansLoaded;
  const factory PlansState.plansRatesLoaded({
    required PlanRate planRate,
  }) = _PlansRatesLoaded;
  const factory PlansState.success() = _Success;
  const factory PlansState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
