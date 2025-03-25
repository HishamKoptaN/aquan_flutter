import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_plans_use_case.dart';
import 'plans_event.dart';
import 'plans_state.dart';

@LazySingleton()
class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final PlanUseCases planUseCases;
  PlansBloc(
    this.planUseCases,
  ) : super(
          const PlansState.initial(),
        ) {
    on<PlansEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const PlansState.loading(),
            );
            final result = await planUseCases.get();
            await result.when(
              success: (plans) async {
                emit(
                  PlansState.plansLoaded(
                    plans: plans!,
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
          getPlansRates: () async {
            emit(
              const PlansState.loading(),
            );
            final result = await planUseCases.getPlansRates();
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
            final result = await planUseCases.change(
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
