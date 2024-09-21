import 'package:aquan/features/withdraw/controller/withdraw_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/withdraw_model.dart';
import '../model/withdraw_rate.dart';
part 'withdraw_event.dart';
part 'withdraw_state.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  final WithdrawController _controller = WithdrawController();

  WithdrawBloc() : super(WithdrawInitial()) {
    on<GetWithdraws>(
      (event, emit) async {
        emit(WithdrawLoading());
        Map<String, dynamic> data = await _controller.getWithdraws();
        GetWithdrawsApiResModel getWithdrawsApiResModel =
            GetWithdrawsApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            WithdrawsLoadedSuccessfully(
              invoices: getWithdrawsApiResModel.withdraws,
            ),
          );
        } else if (!data['status']) {
          emit(WithdrawError(message: data['error']));
        }
      },
    );

    on<GetWithdrawRates>(
      (event, emit) async {
        emit(WithdrawLoading());
        Map<String, dynamic> data = await _controller.getWithdrawRates();
        GetWithdrawRateApiResModel getWithdrawRateApiResModel =
            GetWithdrawRateApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            WithdrawRatesLoadedSuccessfully(
              getWithdrawRateApiResModel: getWithdrawRateApiResModel,
            ),
          );
        } else if (!data['status']) {
          emit(
            WithdrawError(
              message: data['error'],
            ),
          );
        }
      },
    );
    on<CreateWithdraw>(
      (event, emit) async {
        emit(WithdrawLoading());
        Map<String, dynamic> data = await _controller.withdrawMoney(
          method: event.method,
          amount: event.amount,
          receivingAccountNumber: event.receivingWallet,
        );
        if (data['status']) {
          emit(WithdrawCreatedSuccessfully());
        } else if (!data['status']) {
          emit(
            WithdrawError(
              message: data['error'],
            ),
          );
          GetWithdrawRateApiResModel getWithdrawRateApiResModel =
              GetWithdrawRateApiResModel();
          emit(
            WithdrawRatesLoadedSuccessfully(
              getWithdrawRateApiResModel: getWithdrawRateApiResModel,
            ),
          );
        }
      },
    );
  }
}
