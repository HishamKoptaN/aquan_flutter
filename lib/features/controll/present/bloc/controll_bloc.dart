import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/controll_use_cases.dart';
import 'controll_event.dart';
import 'controll_state.dart';

@LazySingleton()
class ControllBloc extends Bloc<ControllEvent, ControllState> {
  ControllUseCases controllUseCases;
  ControllBloc({
    required this.controllUseCases,
  }) : super(
          const ControllState.initial(),
        ) {
    on<ControllEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const ControllState.loading(),
            );
            final result = await controllUseCases.get();
            await result.when(
              success: (sections) async {
                emit(
                  ControllState.loaded(
                    sections: sections!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  ControllState.failure(
                    error: apiErrorModel.error ?? '',
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
