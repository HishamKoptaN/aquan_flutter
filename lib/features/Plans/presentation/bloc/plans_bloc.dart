import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/plans_singleton.dart';
import '../../domain/use_cases/change_plan_use_case.dart';
import '../../domain/use_cases/get_plans_rates_use_case.dart';
import '../../domain/use_cases/get_plans_use_case.dart';
import 'plans_event.dart';
import 'plans_state.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final GetPlansUseCase getPlansUseCase;
  final ChangePlanUseCase changePlanUseCase;
  final GetPlansRatesUseCase getPlansRatesUseCase;
  PlansBloc(
    this.getPlansUseCase,
    this.changePlanUseCase,
    this.getPlansRatesUseCase,
  ) : super(
          const PlansState.initial(),
        ) {
    on<PlansEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            if (PlansSingleton.instance.get != null) {
              emit(
                const PlansState.plansLoaded(),
              );
            } else {
              emit(
                const PlansState.loading(),
              );
              final result = await getPlansUseCase.get();
              await result.when(
                success: (resultPlanRate) async {
                  PlansSingleton.instance.plans = resultPlanRate!;
                  emit(
                    const PlansState.plansLoaded(),
                  );
                },
                failure: (apiErrorModel) async {
                  emit(
                    PlansState.failure(
                      apiErrorModel: apiErrorModel,
                    ),
                  );
                },
              );
            }
          },
          getPlansRates: () async {
            emit(
              const PlansState.loading(),
            );
            final result = await getPlansRatesUseCase.getPlansRates();
            await result.when(
              success: (planRate) async {
                emit(
                  PlansState.plansRatesLoaded(
                    planRate: planRate!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  PlansState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          change: (formData) async {
            emit(
              const PlansState.loading(),
            );
            final result = await changePlanUseCase.change(
              formData: formData,
            );
            await result.when(
              success: (planRate) async {
                emit(
                  const PlansState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  PlansState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
