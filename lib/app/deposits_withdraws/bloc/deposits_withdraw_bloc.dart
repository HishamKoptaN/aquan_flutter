import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/deposits_withdraw_controller.dart';
import '../model/deposits_witdraw_model.dart';
part 'deposits_withdraw_event.dart';
part 'deposits_withdraw_state.dart';

class DeposistWithdrawsBloc
    extends Bloc<WithdrawDepositEvent, DepositWithdrawState> {
  final DepositWithdrawController depositWithdrawController =
      DepositWithdrawController();

  DeposistWithdrawsBloc() : super(DepositWithdrawInitial()) {
    on<GetWithdrawDeposits>(
      (event, emit) async {
        emit(DepositWithdrawLoading());
        try {
          Map<String, dynamic> data =
              await depositWithdrawController.getDepositsWithdraws();
          if (data['status']) {
            GetWithdrawDepositsApiResModel getWithdrawDepositsApiResModel =
                GetWithdrawDepositsApiResModel.fromJson(data);
            emit(
              DepositsWithdrawDone(
                depositsWithdraw: getWithdrawDepositsApiResModel.invoices!,
              ),
            );
          } else if (!data['status']) {
            emit(
              DepositWithdrawError(
                message: data['error'] ?? 'Unknown error',
              ),
            );
          }
        } catch (e) {
          print(e);
          emit(
            DepositWithdrawError(
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
