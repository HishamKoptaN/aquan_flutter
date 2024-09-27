import 'dart:io';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/core/Helpers/styles.dart';
import 'package:aquan/features/transactions/view/transactions_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/Helpers/snack_bar.dart';
import '../../Layouts/app_layout.dart';
import '../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../bloc/buy_sell_bloc.dart';
import '../bloc/buy_sell_state.dart';
import '../model/buy_sell_model.dart';

class BuySellConfirmView extends StatefulWidget {
  const BuySellConfirmView({
    super.key,
    required this.senderWallet,
    required this.receiverWallet,
    required this.amount,
    required this.netAmount,
    required this.rate,
    required this.receiverAccount,
  });
  final CurrencyElement senderWallet;
  final CurrencyElement receiverWallet;
  final String amount;
  final double netAmount;
  final double rate;
  final String receiverAccount;
  @override
  State<BuySellConfirmView> createState() => _BuySellConfirmViewState();
}

class _BuySellConfirmViewState extends State<BuySellConfirmView> {
  File? file;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.buyandsell,
      showAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider<BuySellBloc>(
          create: (context) => BuySellBloc()
            ..add(GetReceivedAccountNumber(id: widget.receiverWallet.id)),
          child: BlocConsumer<BuySellBloc, BuySellState>(
            listener: (context, state) {
              if (state is TransferDone) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: true,
                      message: 'Transfer Done successfully',
                    ),
                  );
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransactionsView(),
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
                    snackBar(
                      status: false,
                      message: state.message,
                    ),
                  );
              }
            },
            builder: (context, state) {
              if (state is ReceivedAccountNumberLoaded) {
                return ListView(
                  children: [
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          t.transferAmount,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.amount,
                            textAlign: TextAlign.center,
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
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.receiverAccount,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  ClipboardData(
                                    text: widget.receiverAccount,
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
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.senderWallet.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  ClipboardData(
                                    text: widget.senderWallet.name,
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
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Text(
                            widget.senderWallet.comment,
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
                                text: widget.senderWallet.comment,
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
                    SizedBox(
                      height: 100.h,
                      child: IconButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File file = File(result.files.single.path!);
                            setState(
                              () {
                                this.file = file;
                              },
                            );
                          }
                        },
                        icon: file != null
                            ? Image.file(
                                fit: BoxFit.fill,
                                file!,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    t.uploadPaymentProof,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.upload,
                                    size: 28,
                                  ),
                                ],
                              ),
                      ),
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
                                color: AppColors.danger,
                              ),
                              minutesDescription: "",
                              secondsDescription: "",
                              timeTextStyle: cartHeading.copyWith(
                                color: AppColors.danger,
                              ),
                              endTime: DateTime.now().add(
                                const Duration(
                                  minutes: 15,
                                  seconds: 00,
                                ),
                              ),
                              onEnd: () {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.black,
                                      onVisible: () async {
                                        await Future.delayed(
                                          const Duration(seconds: 3),
                                          () {
                                            setState(
                                              () {
                                                file = null;
                                              },
                                            );
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const NavigateBarView(),
                                                    ),
                                                    (route) => false);
                                          },
                                        );
                                      },
                                      content: Text(
                                        t.timerEnd,
                                        style: const TextStyle(
                                            color: Colors.white),
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
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              context.read<BuySellBloc>().add(
                                    TransferMoney(
                                      senderCurrencyId: widget.senderWallet.id,
                                      receiverCurrencyId:
                                          widget.receiverWallet.id,
                                      amount: widget.amount,
                                      netAmount: widget.netAmount,
                                      employeeId: state
                                          .receivedAccountNumberApiRes
                                          .account!
                                          .userId!,
                                      rate: widget.rate,
                                      receiverAccount: widget.receiverAccount,
                                      file: file!,
                                    ),
                                  );
                            },
                            child: Text(
                              t.submit,
                              style: const TextStyle(
                                color: Colors.black,
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
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
