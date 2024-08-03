import 'package:aquan/app/accounts/controller/accounts_controller.dart';
import 'package:aquan/app/accounts/model/accounts_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<WalletEvent, AccountsState> {
  final AccountsController _accountsController = AccountsController();

  AccountsBloc() : super(AccountsInitial()) {
    on<GetAccounts>(
      (event, emit) async {
        emit(AccountsLoading());
        Map<String, dynamic> data = await _accountsController.getAccounts();
        if (data['status']) {
          GetUserAccounts getUserAccounts = GetUserAccounts.fromJson(data);
          List<AccountInfo> accountsList = getUserAccounts.accountInfo;
          emit(
            AccountsDone(accounts: accountsList),
          );
        } else if (!data['status']) {
          emit(
            AccountsError(
              message: data['error'],
            ),
          );
        }
      },
    );

    on<UpdateAccounts>(
      (event, emit) async {
        emit(AccountsLoading());
        Map<String, dynamic> data =
            await _accountsController.updateAccounts(event.accountInfo);
        if (data['status']) {
          emit(
            AccountsUpdatedSuccess(),
          );
        } else if (!data['status']) {
          emit(
            AccountsError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
