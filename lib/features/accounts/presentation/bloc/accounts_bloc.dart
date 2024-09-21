import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/accounts_controller.dart';
import '../../data/models/accounts_model.dart';
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
          emit(
            AccountsDone(getUserAccounts: getUserAccounts),
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
        Map<String, dynamic> data = await _accountsController.updateAccounts(
          getUserAccounts: event.getUserAccounts,
        );
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
