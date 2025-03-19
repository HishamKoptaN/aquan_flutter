import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/support_use_cases.dart';
import 'support_event.dart';
import 'support_state.dart';

@LazySingleton()
class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportUseCases supportUseCases;
  SupportBloc({
    required this.supportUseCases,
  }) : super(
          const SupportState.initial(),
        ) {
    on<SupportEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const SupportState.loading(),
            );
            final result = await supportUseCases.get();
            await result!.when(
              success: (sectionResModel) async {
                emit(
                  SupportState.loaded(
                    sectionResModel: sectionResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SupportState.failure(
                    error: apiErrorModel.error ?? '',
                  ),
                );
              },
            );
          },
          getMsgs: () async {},
          sendMsg: (msgSend) async {
            await _sendMessage(
              msgSend,
              emit,
            );
          },
        );
      },
    );
  }

  Future<void> _sendMessage(
    dynamic msgSend,
    Emitter<SupportState> emit,
  ) async {
    try {
      final userId = UserSingleton.instance.user!.id.toString();

      await FirebaseFirestore.instance
          .collection(
            'support',
          )
          .doc(
            userId,
          )
          .collection('msgs')
          .add(
            msgSend.toJson(),
          );

      emit(
        const SupportState.success(),
      );
    } catch (error) {
      emit(
        SupportState.failure(
          error: error.toString(),
        ),
      );
    }
  }
}
