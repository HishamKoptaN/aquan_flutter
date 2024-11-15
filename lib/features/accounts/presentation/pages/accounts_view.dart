import 'package:aquan/features/accounts/domain/entities/account.dart';
import 'package:aquan/features/accounts/domain/usecases/update_accounts_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../../Layouts/app_layout.dart';
import '../../data/datasources/accounts_remote_data_source.dart';
import '../../data/repositories/accounts_repository_impl.dart';
import '../../domain/usecases/get_accounts_usecase.dart';
import '../bloc/accounts_bloc.dart';

class MyAccountsView extends StatefulWidget {
  const MyAccountsView({super.key});
  @override
  State<MyAccountsView> createState() => _MyAccountsViewState();
}

class _MyAccountsViewState extends State<MyAccountsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.myAccounts,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<AccountsBloc>(
          create: (context) => AccountsBloc(
            getAccountsUseCase: GetAccountsUseCase(
              repository: AccountsRepositoryImpl(
                remoteDataSource: AccountsRemoteDataSource(),
              ),
            ),
            updateAccountsUseCase: UpdateAccountsUseCase(
              repository: AccountsRepositoryImpl(
                remoteDataSource: AccountsRemoteDataSource(),
              ),
            ),
          )..add(GetAccountsEvent()),
          child: BlocConsumer<AccountsBloc, AccountsState>(
            listener: (context, state) {
              if (state is AccountsUpdatedSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: true,
                      message: t.accountsUpdated,
                    ),
                  );
                context.read<AccountsBloc>().add(
                      GetAccountsEvent(),
                    );
              }
              if (state is AccountsError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: false,
                      message: state.message,
                    ),
                  );
                if (kDebugMode) {
                  print(state.message);
                }
              }
            },
            builder: (context, state) {
              if (state is AccountsError) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AccountsBloc>().add(
                            UpdateAccountsEvent(
                              accounts: state.accounts,
                            ),
                          );
                    },
                    child: const Text(
                      "Try Again",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
              if (state is AccountsLoaded) {
                return Column(
                  children: [
                    SizedBox(
                      height: 500.h,
                      child: ListView.builder(
                        itemCount: state.accounts.length,
                        itemBuilder: (context, index) {
                          var account = state.accounts[index];
                          TextEditingController controller =
                              TextEditingController(
                            text: account.accountNumber,
                          );
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  account.currency.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                SizedBox(
                                  width: size.width,
                                  child: TextFormField(
                                    controller: controller,
                                    onChanged: (value) {
                                      state.accounts[index].accountNumber =
                                          value;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SubmitButton(
                      onPressed: () {
                        context.read<AccountsBloc>().add(
                              UpdateAccountsEvent(
                                accounts: state.accounts,
                              ),
                            );
                      },
                    ),
                    Gap(10.h),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// class AccountsList extends StatelessWidget {
//   final List<Account> accounts;
//   const AccountsList({super.key, required this.accounts});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500.h,
//       child: ListView.builder(
//         itemCount: accounts.length,
//         itemBuilder: (context, index) {
//           var account = accounts[index];
//           TextEditingController controller =
//               TextEditingController(text: account.accountNumber);
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   account.currency.name,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Gap(10),
//                 SizedBox(
//                   width: size.width,
//                   child: TextFormField(
//                     controller: controller,
//                     onChanged: (value) {
//                       accounts[index].accountNumber = value;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SubmitButton({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50.h,
      width: size.width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Colors.amber,
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(
          t.submit,
          style: const TextStyle(color: Colors.black, fontFamily: "Arial"),
        ),
      ),
    );
  }
}
