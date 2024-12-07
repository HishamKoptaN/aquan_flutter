import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/user_singleton.dart';
import 'support_event.dart';
import 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  // final GetMsgsUseCase getMsgsUseCase;
  // final SendMsgUseCase sendMsgUseCase;
  SupportBloc(
      // {required this.getMsgsUseCase,
      // required this.sendMsgUseCase,}
      )
      : super(
          const SupportState.initial(),
        ) {
    on<SupportEvent>(
      (event, emit) async {
        await event.when(
          getMsgs: (
            chatId,
          ) async {
            emit(
              const SupportState.loading(),
            );
          },
          sendMsg: (
            chatId,
            msgSend,
          ) async {
            try {
              await FirebaseFirestore.instance
                  .collection('support')
                  .doc(
                    chatId.toString(),
                  )
                  .collection('msgs')
                  .add(msgSend.toJson())
                  .then(
                (value) async {
                  await FirebaseFirestore.instance
                      .collection('support')
                      .doc(
                        chatId.toString(),
                      )
                      .update(
                    {
                      'user_image': UserSingleton.instance.user!.image,
                      'user_name': UserSingleton.instance.user!.name,
                      'last_msg_timestamp': FieldValue.serverTimestamp(),
                    },
                  );
                },
              ).catchError(
                (error) {
                  emit(
                    const SupportState.failure(
                      error: '',
                    ),
                  );
                },
              );
            } catch (e) {}
          },
        );
      },
    );
  }
}
