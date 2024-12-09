import 'package:aquan/features/buy_sell/presentation/bloc/buy_sell_bloc.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import 'package:aquan/features/buy_sell/presentation/view/widgets/button_buy_sell_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../Widgets/convert_currency_price.dart';
import '../bloc/buy_sell_event.dart';
import '../bloc/buy_sell_state.dart';
import '../../data/model/buy_sell_model.dart';
import '../../data/model/transfer_money_model.dart';
import 'buy_sell_confirm_view.dart';

class BuySellview extends StatefulWidget {
  const BuySellview({super.key});
  @override
  State<BuySellview> createState() => _BuySellviewState();
}

class _BuySellviewState extends State<BuySellview> {
  final formkey = GlobalKey<FormState>();
  bool canMakeTransfer = true;
  int? toCurrency;
  final TextEditingController receiverAccountController =
      TextEditingController();
  final TextEditingController fromAmountController = TextEditingController();
  final TextEditingController toAmountController = TextEditingController();
  CurrencyElement? fromWallet;
  CurrencyElement? toWallet;
  double rate = 0;
  double netAmount = 0;
  final TextEditingController colorController = TextEditingController();
  final NumberFormat numberFormat = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final t = AppLocalizations.of(context);

    String? validateTransfer({
      required BuySellResModel buySellResModel,
    }) {
      double amount = double.parse(
        toAmountController.text,
      );
      if (amount < 10.0) {
        return "${t!.min_transfer} 10 \$";
      }
      if (fromWallet!.id == 2) {
        if (buySellResModel.totalMonthlyTransfers! >
            buySellResModel.monthlyTransferCount!) {
          return t!.monthly_transfer_limit;
        }

        if (buySellResModel.totalDailyTransfers! >
            buySellResModel.dailyTransferCount!) {
          return t!.daily_transfer_limit;
        }

        if (amount > buySellResModel.maxTransferCount!) {
          return "${t!.max_transfer} : ${buySellResModel.maxTransferCount.toString()}";
        }
      }

      return null;
    }

    return AppLayout(
      route: t!.buyandsell,
      showAppBar: true,
      backArow: false,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: BlocProvider<BuySellBloc>(
          create: (context) => BuySellBloc(
            getBuySellRatesUse: getIt(),
            getReceiveAccountNumberUseCase: getIt(),
            transferMoneyUseCase: getIt(),
          ),
          child: BlocConsumer<BuySellBloc, BuySellState>(
            listener: (context, state) {},
            builder: (context, state) {
              state.whenOrNull(
                initial: () {
                  context.read<BuySellBloc>().add(
                        const BuySellEvent.getBuySelRates(),
                      );
                },
              );
              return state.maybeWhen(
                buySellRatesLoaded: (buySellResModel) {
                  return ListView(
                    children: [
                      Form(
                        key: formkey,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Gap(50),
                                        Row(
                                          children: [
                                            Gap(5.w),
                                            Text(
                                              t.from,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            Gap(5.w),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<
                                                      CurrencyElement>(
                                                    isExpanded: true,
                                                    value: fromWallet,
                                                    onChanged: (CurrencyElement?
                                                        newValue) {
                                                      setState(
                                                        () {
                                                          fromAmountController
                                                              .text = "";
                                                          fromWallet = newValue;
                                                          if (toWallet ==
                                                              newValue) {
                                                            toWallet = null;
                                                          }
                                                        },
                                                      );
                                                    },
                                                    items: buySellResModel
                                                        .currencies!
                                                        .map(
                                                      (CurrencyElement
                                                          currency) {
                                                        return DropdownMenuItem<
                                                            CurrencyElement>(
                                                          value: currency,
                                                          child: Text(
                                                            currency.name!,
                                                          ),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Gap(5.w),
                                            Text(
                                              t.to,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            Gap(5.w),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<
                                                      CurrencyElement>(
                                                    isExpanded: true,
                                                    value: toWallet,
                                                    onChanged: (CurrencyElement?
                                                        newValue) {
                                                      setState(
                                                        () {
                                                          toAmountController
                                                              .text = "";
                                                          toWallet = newValue;
                                                          rate =
                                                              buySellResModel
                                                                  .rates!
                                                                  .firstWhere(
                                                                    (rate) =>
                                                                        fromWallet!.id == rate.from &&
                                                                        buySellResModel.userPlanId ==
                                                                            rate
                                                                                .planId &&
                                                                        toWallet!.id ==
                                                                            rate.to,
                                                                  )
                                                                  .price!;
                                                        },
                                                      );
                                                    },
                                                    items: buySellResModel
                                                        .currencies!
                                                        .where(
                                                      (CurrencyElement
                                                          currency) {
                                                        return currency !=
                                                            fromWallet;
                                                      },
                                                    ).map(
                                                      (CurrencyElement
                                                          currency) {
                                                        return DropdownMenuItem<
                                                            CurrencyElement>(
                                                          value: currency,
                                                          child: Text(
                                                            currency.name!,
                                                          ),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Gap(25.h),
                                        if (fromWallet != null &&
                                            toWallet != null)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                t.price,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Gap(20.h),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Text(
                                                    NumberFormat('#,##0')
                                                        .format(
                                                      rate,
                                                    ),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.error),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'مساعدة'),
                                                        content: const Text(
                                                            'إدخال المساعدة أو التفسير هنا.'),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: const Text(
                                                              'موافق',
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        Gap(25.h),
                                        if (fromWallet != null &&
                                            toWallet != null)
                                          ConvertCurrencyPrice(
                                            controller: fromAmountController,
                                            wallet: fromWallet,
                                            size: size,
                                            onChanged: (value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                String newValue =
                                                    value.replaceAll(',', '');
                                                double amount =
                                                    double.parse(newValue);
                                                netAmount = calculateAmount(
                                                  amount: amount,
                                                  currencyCode:
                                                      fromWallet!.nameCode!,
                                                  rate: rate,
                                                );
                                                setState(() {
                                                  toAmountController.text =
                                                      numberFormat
                                                          .format(netAmount);
                                                  fromAmountController.text =
                                                      numberFormat
                                                          .format(amount);
                                                });
                                              } else {
                                                setState(() {
                                                  toAmountController.text = "0";
                                                });
                                              }
                                            },
                                          ),
                                        if (fromWallet != null &&
                                            toWallet != null)
                                          ConvertCurrencyPrice(
                                            controller: toAmountController,
                                            wallet: toWallet,
                                            size: size,
                                            onChanged: (value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                String newValue =
                                                    value.replaceAll(',', '');
                                                double amount =
                                                    double.parse(newValue);
                                                double netAmount =
                                                    calculateAmount(
                                                  amount: amount,
                                                  currencyCode:
                                                      toWallet!.nameCode!,
                                                  rate: rate,
                                                );
                                                setState(
                                                  () {
                                                    fromAmountController.text =
                                                        numberFormat
                                                            .format(netAmount);
                                                    toAmountController.text =
                                                        numberFormat
                                                            .format(amount);
                                                  },
                                                );
                                              } else {
                                                setState(
                                                  () {
                                                    fromAmountController.text =
                                                        "0";
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  t.accountId,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Gap(20.h),
                                            SizedBox(
                                              width: size.width,
                                              child: TextFormField(
                                                controller:
                                                    receiverAccountController,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return t.required;
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: t.accountId,
                                                  suffixIcon:
                                                      PopupMenuButton<Account>(
                                                    icon: const Icon(
                                                      Icons.arrow_drop_down,
                                                    ),
                                                    onSelected:
                                                        (Account value) {
                                                      receiverAccountController
                                                              .text =
                                                          value.accountNumber!;
                                                    },
                                                    itemBuilder:
                                                        (BuildContext context) {
                                                      return buySellResModel
                                                          .accounts!
                                                          .map<
                                                              PopupMenuEntry<
                                                                  Account>>(
                                                        (
                                                          Account account,
                                                        ) {
                                                          return PopupMenuItem<
                                                              Account>(
                                                            value: account,
                                                            child: Text(
                                                              '${account.currency!.name!} - ${account.accountNumber}',
                                                            ),
                                                          );
                                                        },
                                                      ).toList();
                                                    },
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Gap(20.h),
                                      ],
                                    ),
                                  ),
                                ),
                                ButtonBuySellWidget(
                                  onTap: () async {
                                    if (formkey.currentState!.validate()) {
                                      String? errorMessage = validateTransfer(
                                        buySellResModel: buySellResModel,
                                      );
                                      if (errorMessage != null) {
                                        ToastNotifier().showError(
                                          context: context,
                                          message: errorMessage,
                                        );
                                      } else {
                                        String newAmount = fromAmountController
                                            .text
                                            .replaceAll(',', '');
                                        TransferMoneyRquestmodel()
                                          ..senderCurrencyId =
                                              fromWallet!.id.toString()
                                          ..receiverCurrencyId = toWallet!.id
                                          ..amount = newAmount
                                          ..rate = rate
                                          ..receiverAccount =
                                              receiverAccountController.text;

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BuySellConfirmView(),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                                Gap(30.h),
                              ],
                            ),
                            buySellResModel.buySellStatus!
                                ? const SizedBox()
                                : Center(
                                    child: Container(
                                      width: width,
                                      height: height,
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(81, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: width / 1.25,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                child: CustomText(
                                                  text: buySellResModel
                                                      .buySellMessage!,
                                                  fontSize: 20.sp,
                                                  color: Colors.black,
                                                  maxLines: 5,
                                                  fontWeight: null,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                failure: (a) {
                  return const CustomCircularProgress();
                },
                loading: () {
                  return const CustomCircularProgress();
                },
                orElse: () {
                  return const CustomCircularProgress();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  double calculateAmount({
    required double rate,
    required String currencyCode,
    required double amount,
  }) {
    double resultAmount = 0;
    if (currencyCode == 'SDG') {
      resultAmount = amount / rate;
    }
    if (currencyCode == 'USDT') {
      resultAmount = amount * rate;
    }
    if (currencyCode == 'USD') {
      resultAmount = amount * rate;
    }
    return resultAmount;
  }
}
