import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/user_singleton.dart';
import 'support_event.dart';
import 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(const SupportState.initial(),) {
    on<SupportEvent>(
      (event, emit) async {
        await event.when(
          get: () async {},
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
