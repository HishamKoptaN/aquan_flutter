import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Layouts/app_layout.dart';
import 'package:aquan/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';

class SendToAccount extends StatefulWidget {
  const SendToAccount({super.key});

  @override
  State<SendToAccount> createState() => _SendToAccountState();
}

class _SendToAccountState extends State<SendToAccount> {
  String accountId = "";
  String amount = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.sendToAnOtherAccount,
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserError ||
                state is UserAccountLoaded ||
                state is AmountSent) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  setState(() {
                    loading = false;
                  });
                },
              );
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if (state is UserError)
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: danger,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  if (state is AmountSent)
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        t.amountSent,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: t.accountId,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(
                        FontAwesomeIcons.userLock,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        accountId = value;
                      });
                    },
                  ),
                  const Gap(10),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        if (accountId.isNotEmpty) {
                          context.read<UserBloc>().add(
                                GetNameOfUserByAccount(
                                  accountId: accountId,
                                ),
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: black,
                              ),
                            )
                          : Text(
                              t.search,
                              style: const TextStyle(
                                color: black,
                                fontFamily: "Arial",
                              ),
                            ),
                    ),
                  ),
                  if (state is UserAccountLoaded)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        state.name,
                        style: cartHeading,
                      ),
                    ),
                  const Gap(10),
                  if (state is UserAccountLoaded)
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: t.amount,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.dollarSign,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          amount = value;
                        });
                      },
                    ),
                  const Gap(10),
                  if (state is UserAccountLoaded)
                    SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          if (accountId.isNotEmpty && state.name.isNotEmpty) {
                            context.read<UserBloc>().add(
                                  SendPaymentToOtherAccount(
                                      accountId: accountId, amount: amount),
                                );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          t.submit,
                          style: const TextStyle(
                            color: black,
                            fontFamily: "Arial",
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
    );
  }
}
