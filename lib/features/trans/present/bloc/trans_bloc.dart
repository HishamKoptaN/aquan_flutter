import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/singletons/trans_singleton.dart';
import '../../domain/use_cases/get_trans_use_case.dart';
import 'trans_event.dart';
import 'trans_state.dart';
@LazySingleton()

class TransBloc extends Bloc<TransEvent, TransState> {
  final GetTransUseCase getTransUseCase;
  TransBloc(
    this.getTransUseCase,
  ) : super(
          const TransState.initial(),
        ) {
    on<TransEvent>(
      (event, emit) async {
        emit(
          const TransState.loading(),
        );
        final result = await getTransUseCase.get();
        await result.when(
          success: (trans) async {
            TransSingleton.instance.trans = trans;
            emit(
              const TransState.dataLoaded(),
            );
          },
          failure: (
            apiErrorModel,
          ) async {
            emit(
              TransState.failure(
                apiErrorModel: apiErrorModel,
              ),
            );
          },
        );
      },
    );
  }
}
