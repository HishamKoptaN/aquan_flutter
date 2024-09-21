import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/withdraws_deposits_controller.dart';
import '../model/withdraws_deposits_model.dart';
part 'withdraw_deposits_event.dart';
part 'withdraws_deposits_state.dart';

class DeposistWithdrawsBloc
    extends Bloc<WithdrawDepositEvent, DepositWithdrawState> {
  final WithdrawsDepositsController withdrawsDepositsController =
      WithdrawsDepositsController();

  DeposistWithdrawsBloc() : super(DepositWithdrawInitial()) {
    on<GetWithdrawDeposits>(
      (event, emit) async {
        emit(DepositWithdrawLoading());
        Map<String, dynamic> data =
            await withdrawsDepositsController.getWithdrawsDeposits();
        GetWithdrawDepositsApiResModel getWithdrawDepositsApiResModel =
            GetWithdrawDepositsApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            WithdrawsDepositsLoadedSuccessfully(
              getWithdrawDepositsApiResModel: getWithdrawDepositsApiResModel,
            ),
          );
        } else if (!data['status']) {
          emit(
            DepositWithdrawError(
              message: data['error'] ?? 'Unknown error',
            ),
          );
        }
      },
    );
  }
}
