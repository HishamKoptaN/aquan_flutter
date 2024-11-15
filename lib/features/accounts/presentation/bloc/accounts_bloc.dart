import 'package:bloc/bloc.dart';
import '../../data/models/accounts_model.dart';
import '../../domain/usecases/get_accounts_usecase.dart';
import '../../domain/usecases/update_accounts_usecase.dart';
part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final GetAccountsUseCase getAccountsUseCase;
  final UpdateAccountsUseCase updateAccountsUseCase;
  AccountsBloc({
    required this.getAccountsUseCase,
    required this.updateAccountsUseCase,
  }) : super(
          AccountsInitial(),
        ) {
    on<GetAccountsEvent>(
      (event, emit) async {
        emit(AccountsLoading());
        try {
          final eitherResult = await getAccountsUseCase();
          eitherResult.fold(
            (failure) {
              emit(
                AccountsError(
                  message: failure.errMessage,
                  accounts: [],
                ),
              );
            },
            (accounts) {
              emit(
                AccountsLoaded(
                  accounts: accounts,
                ),
              );
            },
          );
        } catch (error) {
          emit(
            AccountsError(
              message: error.toString(),
              accounts: [],
            ),
          );
        }
      },
    );
    on<UpdateAccountsEvent>(
      (event, emit) async {
        emit(AccountsLoading());
        try {
          final eitherResult = await updateAccountsUseCase(
            accounts: event.accounts,
          );
          eitherResult.fold(
            (failure) {
              emit(
                AccountsError(
                  message: failure.errMessage,
                  accounts: event.accounts,
                ),
              );
            },
            (accounts) {
              emit(
                AccountsUpdatedSuccess(),
              );
            },
          );
        } catch (error) {
          emit(
            AccountsError(
              message: error.toString(),
              accounts: event.accounts,
            ),
          );
        }
      },
    );
  }
}
