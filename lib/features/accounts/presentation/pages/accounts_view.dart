import 'package:aquan/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Helpers/snack_bar.dart';
import '../bloc/accounts_bloc.dart';

class MyAccountsView extends StatefulWidget {
  const MyAccountsView({super.key});
  @override
  State<MyAccountsView> createState() => _MyAccountsViewState();
}

class _MyAccountsViewState extends State<MyAccountsView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          t.myAccounts,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<AccountsBloc>(
          create: (context) => AccountsBloc()..add(GetAccounts()),
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
                context.read<AccountsBloc>().add(GetAccounts());
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
              }
            },
            builder: (context, state) {
              if (state is AccountsDone) {
                return Column(
                  children: [
                    SizedBox(
                      height: 500.h,
                      child: ListView.builder(
                        itemCount: state.getUserAccounts.accounts.length,
                        itemBuilder: (context, index) {
                          var account = state.getUserAccounts.accounts[index];
                          controller = TextEditingController(
                            text: account.accountNumber,
                          );
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
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
                                      state.getUserAccounts.accounts[index]
                                          .accountNumber = value;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        ),
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
                    SizedBox(
                      height: 50.h,
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          context.read<AccountsBloc>().add(
                                UpdateAccounts(
                                  getUserAccounts: state.getUserAccounts,
                                ),
                              );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          t.submit,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Arial",
                          ),
                        ),
                      ),
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
