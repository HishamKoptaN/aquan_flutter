import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_dash_use_case.dart';
import 'dash_event.dart';
import 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  final GetDashUseCase getDashUseCase;
  DashBloc(this.getDashUseCase)
      : super(
          const DashState.initial(),
        ) {
    on<DashEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const DashState.loading(),
            );
            final result = await getDashUseCase.get();
            await result.when(
              success: (dashResModel) async {
                emit(
                  const DashState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  DashState.failure(
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
