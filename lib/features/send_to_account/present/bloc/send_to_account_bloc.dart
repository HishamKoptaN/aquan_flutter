import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_username_by_account_use_case.dart';
import '../../domain/use_cases/send_to_account_use_case.dart';
import 'send_to_account_event.dart';
import 'send_to_account_state.dart';
@LazySingleton()

class SendToAccountBloc extends Bloc<SendToAccountEvent, SendToAccountState> {
  GetNameOfUserByAccountUseCase getNameOfUserByAccountUseCase;
  SendToAccountUseCase sendToAccountUseCase;

  SendToAccountBloc({
    required this.getNameOfUserByAccountUseCase,
    required this.sendToAccountUseCase,
  }) : super(
          const SendToAccountState.initial(),
        ) {
    on<SendToAccountEvent>(
      (event, emit) async {
        await event.whenOrNull(
          getNameOfUserByAccount: (accountNumber) async {
            emit(
              const SendToAccountState.loading(),
            );
            final result = await getNameOfUserByAccountUseCase.get(
              accountNumber: accountNumber,
            );
            await result.when(
              success: (usernameByAccountResModel) async {
                emit(
                  SendToAccountState.userNameLoaded(
                    usernameByAccountResModel: usernameByAccountResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SendToAccountState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          sendPaymentToOtherAccount: (
            transferReqBody,
          ) async {
            emit(
              const SendToAccountState.loading(),
            );
            final result = await sendToAccountUseCase.send(
              transferReqBody: transferReqBody,
            );
            await result.when(
              success: (getUserByAccountApiResModel) async {
                emit(
                  const SendToAccountState.amountSentSuccessfully(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SendToAccountState.failure(
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
