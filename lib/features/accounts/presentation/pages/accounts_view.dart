import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/singletons/account.dart';
import '../../../../core/singletons/accounts_singleton.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../layouts/app_layout.dart';
import '../bloc/accounts_bloc.dart';
import '../bloc/accounts_event.dart';
import '../bloc/accounts_state.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});
  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends State<AccountsView> {
  List<Account>? accounts;
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.myAccounts,
      showAppBar: true,
      body: BlocProvider<AccountsBloc>(
        create: (context) => AccountsBloc(
          getAccountsUseCase: getIt(),
          editAccountUseCase: getIt(),
        )..add(
            const AccountsEvent.get(),
          ),
        child: BlocConsumer<AccountsBloc, AccountsState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.success,
                );
              },
              failure: (a) {
                ToastNotifier().showError(
                  context: context,
                  message: t.error,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: () {
                accounts ??= List<Account>.from(
                  AccountsSingleton.instance.accounts!,
                );
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: accounts!.length,
                        itemBuilder: (context, index) {
                          Account account = accounts![index];
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
                                  account.currency!.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(
                                  10.h,
                                ),
                                SizedBox(
                                  width: size.width,
                                  child: TextFormField(
                                    controller: controller,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      accounts![index] = account.copyWith(
                                        accountNumber: value,
                                      );
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
                              AccountsEvent.edit(
                                accounts: accounts!,
                              ),
                            );
                      },
                    ),
                    Gap(
                      10.h,
                    ),
                  ],
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
              failure: (a) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      // context.read<AccountsBloc>().add(
                      //       UpdateAccountsEvent(
                      //         accounts: state.accounts,
                      //       ),
                      //     );
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
              },
            );
          },
        ),
      ),
    );
  }
}

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
