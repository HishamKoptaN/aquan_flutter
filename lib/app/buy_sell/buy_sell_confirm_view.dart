import 'dart:io';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;
import '../Layouts/app_layout.dart';
import '../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import 'bloc/buy_sell_bloc.dart';
import 'bloc/buy_sell_state.dart';
import 'model/buy_sell_model.dart';
import '../dashboard/view/dashboard_view.dart';

class BuySellConfirmView extends StatefulWidget {
  const BuySellConfirmView({
    super.key,
    required this.sWallet,
    required this.dWallet,
    required this.amount,
    required this.rate,
    required this.accountNumber,
  });

  final Currency sWallet;
  final Currency dWallet;
  final String amount;
  final double rate;

  final String accountNumber;

  @override
  State<BuySellConfirmView> createState() => _BuySellConfirmViewState();
}

class _BuySellConfirmViewState extends State<BuySellConfirmView> {
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
      showAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider<CurrencyBloc>(
          create: (context) => CurrencyBloc(),
          child: BlocConsumer<CurrencyBloc, BuySellState>(
            listener: (context, state) {
              if (state is TransferDone) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transfer Done successfully'),
                    duration: Duration(seconds: 4),
                  ),
                );
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigateBarView(),
                      ),
                      (route) => false,
                    );
                  },
                );
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
                            widget.sWallet.name!,
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
                                  text: widget.sWallet.name!,
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
                          widget.sWallet.comment!,
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
                              text: widget.sWallet.comment!,
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
                                                      const DashboardScreen(),
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
                          color: amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            context.read<CurrencyBloc>().add(
                                  TransferMoney(
                                    sourceWalletId: widget.sWallet.id!,
                                    destinationWalletId: widget.dWallet.id!,
                                    amount: int.parse(widget.amount),
                                    accountId: widget.accountNumber,
                                    rate: widget.rate,
                                    receiverAccount: widget.accountNumber,
                                    // file: file!,
                                  ),
                                );
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
