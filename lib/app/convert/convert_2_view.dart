import 'dart:io';

import 'package:aquan/app/currency/bloc/currency_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/currency/model/currency.dart';
import 'package:aquan/app/home_page/view/dashboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

import '../transaction/view/transactions_view.dart';

class ConvertSecondScreen extends StatefulWidget {
  const ConvertSecondScreen({
    super.key,
    required this.accountId,
    required this.sWallet,
    required this.dWallet,
    required this.amount,
  });

  final String accountId;
  final Currency sWallet;
  final Currency dWallet;
  final String amount;

  @override
  State<ConvertSecondScreen> createState() => _ConvertSecondScreenState();
}

class _ConvertSecondScreenState extends State<ConvertSecondScreen> {
  File? file;

  intl.NumberFormat formatter = intl.NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.buyandsell,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider<CurrencyBloc>(
          create: (context) => CurrencyBloc(),
          child: BlocConsumer<CurrencyBloc, CurrencyState>(
            listener: (context, state) {
              if (state is TransferDone) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const TransactionsScreen(),
                    ),
                    (route) => false);
              }

              if (state is CurrencyError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: danger,
                      duration: const Duration(seconds: 3),
                      content: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.transferAmount,
                        style: const TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          textAlign: TextAlign.center,
                          formatter.format(double.parse(widget.amount)),
                          style: cartHeading,
                        ),
                      )
                    ],
                  ),
                  const Gap(10),
                  const Divider(),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.accountNumber,
                        style: const TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.sWallet.paymentInfo!.accountId!,
                            style: const TextStyle(
                              color: black,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(
                                  text: widget.sWallet.paymentInfo!.accountId!,
                                ),
                              );
                            },
                            icon: const Icon(
                              FontAwesomeIcons.copy,
                              size: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.name,
                        style: const TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.sWallet.paymentInfo!.name!,
                            style: const TextStyle(
                              color: black,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(
                                  text: widget.sWallet.paymentInfo!.name!,
                                ),
                              );
                            },
                            icon: const Icon(
                              FontAwesomeIcons.copy,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.comment,
                        style: const TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: Text(
                          widget.sWallet.comment ?? "",
                          textAlign: TextAlign.center,
                          style: cartHeading.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(
                              text: widget.sWallet.comment ?? "",
                            ),
                          );
                        },
                        icon: const Icon(
                          FontAwesomeIcons.copy,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        t.uploadPaymentProof,
                        style: const TextStyle(
                          color: black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path!);

                            setState(() {
                              this.file = file;
                            });
                          }
                        },
                        icon: const Icon(
                          FontAwesomeIcons.upload,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                  const Gap(10),
                  const Divider(),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          t.payIn,
                          style: cartHeading,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TimerCountdown(
                            format: CountDownTimerFormat.minutesSeconds,
                            spacerWidth: 5,
                            colonsTextStyle: cartHeading.copyWith(
                              color: danger,
                            ),
                            minutesDescription: "",
                            secondsDescription: "",
                            timeTextStyle: cartHeading.copyWith(
                              color: danger,
                            ),
                            endTime: DateTime.now().add(
                              const Duration(
                                minutes: 30,
                                seconds: 00,
                              ),
                            ),
                            onEnd: () {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: black,
                                    onVisible: () async {
                                      await Future.delayed(
                                          const Duration(seconds: 3), () {
                                        setState(() {
                                          file = null;
                                        });
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DashboardView(),
                                                ),
                                                (route) => false);
                                      });
                                    },
                                    content: Text(
                                      t.timerEnd,
                                      style: const TextStyle(color: white),
                                    ),
                                  ),
                                );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (file != null) {
                              context.read<CurrencyBloc>().add(
                                    TransferMoney(
                                      sWallet: widget.sWallet,
                                      dWallet: widget.dWallet,
                                      amount: double.parse(widget.amount),
                                      accountId: widget.accountId,
                                      file: file!,
                                    ),
                                  );
                            }
                          },
                          child: Text(
                            t.submit,
                            style: const TextStyle(
                              color: black,
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
