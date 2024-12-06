import 'dart:io';
import 'package:aquan/core/di/dependency_injection.dart';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/core/utils/styles.dart';
import 'package:aquan/features/trans/presentation/view/trans_view.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../Layouts/app_layout.dart';
import '../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../bloc/buy_sell_bloc.dart';
import '../bloc/buy_sell_event.dart';
import '../bloc/buy_sell_state.dart';
import '../../data/model/transfer_money_model.dart';

class BuySellConfirmView extends StatefulWidget {
  const BuySellConfirmView({
    super.key,
    // required this.senderWallet,
    // required this.receiverWallet,
    // required this.amount,
    // required this.netAmount,
    // required this.rate,
    // required this.receiverAccount,
  });
  // final CurrencyElement senderWallet;
  // final CurrencyElement receiverWallet;
  // final double amount;
  // final double netAmount;
  // final double rate;
  // final String receiverAccount;
  @override
  State<BuySellConfirmView> createState() => _BuySellConfirmViewState();
}

class _BuySellConfirmViewState extends State<BuySellConfirmView> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.buyandsell,
      showAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider<BuySellBloc>(
          create: (context) => BuySellBloc(
            getBuySellRatesUse: getIt(),
            getReceiveAccountNumberUseCase: getIt(),
            transferMoneyUseCase: getIt(),
          )..add(
              BuySellEvent.getReceivedAccountNumber(
                id: TransferMoneyRquestmodel().receiverCurrencyId,
              ),
            ),
          child: BlocConsumer<BuySellBloc, BuySellState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  ToastNotifier().showSuccess(
                    context: context,
                    message: t.success,
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
                },
                failure: (error) {
                  ToastNotifier().showError(
                    context: context,
                    message: t.error,
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                rceivedAccountNumberLoaded: (receivedAccountNumberResModel) {
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
                              TransferMoneyRquestmodel().amount.toString(),
                              textAlign: TextAlign.center,
                              // style: cartHeading,
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
                                TransferMoneyRquestmodel()
                                    .receiverAccount
                                    .toString(),
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
                                      text: TransferMoneyRquestmodel()
                                          .receiverAccount!,
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
                              const Text(
                                " TransferMoneyRquestmodel().senderWallet.name!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await Clipboard.setData(
                                    const ClipboardData(
                                      text: " widget.senderWallet.name!",
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
                              " widget.senderWallet.comment!",
                              textAlign: TextAlign.center,
                              style: cartHeading.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                const ClipboardData(
                                  text: "widget.senderWallet.comment!",
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
                                  TransferMoneyRquestmodel().imageFile = file;
                                },
                              );
                            }
                          },
                          icon: TransferMoneyRquestmodel().imageFile != null
                              ? Image.file(
                                  fit: BoxFit.fill,
                                  TransferMoneyRquestmodel().imageFile!,
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
                                                  TransferMoneyRquestmodel()
                                                      .imageFile = null;
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
                                FormData formData = FormData.fromMap({
                                  'sender_currency_id':
                                      TransferMoneyRquestmodel()
                                          .senderCurrencyId,
                                  'receiver_currency_id':
                                      TransferMoneyRquestmodel()
                                          .receiverCurrencyId,
                                  'amount': TransferMoneyRquestmodel().amount,
                                  'net_amount':
                                      TransferMoneyRquestmodel().netAmount,
                                  'rate': TransferMoneyRquestmodel().rate,
                                  'receiver_account': TransferMoneyRquestmodel()
                                      .receiverAccount,
                                  'employee_id':
                                      TransferMoneyRquestmodel().employeeId,

                                  // تضمين الصورة كـ MultipartFile
                                  if (TransferMoneyRquestmodel().imageFile !=
                                      null)
                                    'files': await MultipartFile.fromFile(
                                      TransferMoneyRquestmodel()
                                          .imageFile!
                                          .path,
                                      filename: 'transfer_image.jpg',
                                    ),
                                });
                                context.read<BuySellBloc>().add(
                                      BuySellEvent.transferMoney(
                                          formData: formData
                                          // senderCurrencyId:
                                          //     widget.senderWallet.id!,
                                          // receiverCurrencyId:
                                          //     widget.receiverWallet.id!,
                                          // netAmount: widget.netAmount,
                                          // employeeId: state
                                          //     .receivedAccountNumberApiRes
                                          //     .account!
                                          //     .userId!,
                                          // rate: widget.rate,
                                          // receiverAccount: widget.receiverAccount,
                                          // file: file!,
                                          // amount: widget.amount,
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
                },
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
