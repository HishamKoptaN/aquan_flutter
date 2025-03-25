import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/singletons/accounts_singleton.dart';
import '../../domain/usecases/edit_accounts_usecase.dart';
import '../../domain/usecases/get_accounts_usecase.dart';
import 'accounts_event.dart';
import 'accounts_state.dart';
@LazySingleton()

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAccountsUseCase getAccountsUseCase;
  final EditAccountUseCase editAccountUseCase;

  AccountsBloc({
    required this.getAccountsUseCase,
    required this.editAccountUseCase,
  }) : super(
          const AccountsState.initial(),
        ) {
    on<AccountsEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const AccountsState.loading(),
            );
            final result = await getAccountsUseCase.get();
            await result.when(
              success: (response) async {
                AccountsSingleton.instance.accounts = response;
                emit(
                  const AccountsState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  AccountsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          edit: (accounts) async {
            emit(
              const AccountsState.loading(),
            );
            final result = await editAccountUseCase.edit(
              accounts: accounts,
            );
            await result.when(
              success: (
                response,
              ) async {
                AccountsSingleton.instance.accounts = response;

                emit(
                  const AccountsState.success(),
                );
                emit(
                  const AccountsState.loaded(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  AccountsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const AccountsState.loaded(),
                );
              },
            );
          },
        );
      },
    );
  }
}
