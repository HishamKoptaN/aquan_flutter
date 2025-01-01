import 'package:aquan/core/widgets/custom_text_button_widget.dart';
import 'package:aquan/features/buy_sell/present/bloc/buy_sell_bloc.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import 'package:aquan/features/buy_sell/present/view/widgets/button_buy_sell_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/methods/format_as_currency.dart';
import '../../../../core/models/account.dart';
import '../../../../core/models/currency.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../widgets/convert_currency_price.dart';
import '../bloc/buy_sell_event.dart';
import '../bloc/buy_sell_state.dart';
import '../../data/model/buy_sell_res_model.dart';
import '../../data/model/transfer_money_model.dart';
import 'buy_sell_confirm_view.dart';
import 'widgets/select_curencies_widget.dart';

class BuySellview extends StatefulWidget {
  const BuySellview({super.key});
  @override
  State<BuySellview> createState() => _BuySellviewState();
}

class _BuySellviewState extends State<BuySellview> {
  final formkey = GlobalKey<FormState>();
  bool canMakeTransfer = true;
  final TextEditingController receiverAccountController =
      TextEditingController();
  final TextEditingController fromAmountController = TextEditingController();
  final TextEditingController toAmountController = TextEditingController();
  Currency? fromCurrency;
  Currency? toCurrency;
  int rate = 0;
  int netAmount = 0;
  final TextEditingController colorController = TextEditingController();
  @override
  Widget build(
    context,
  ) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final t = AppLocalizations.of(context);
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
          child: BlocBuilder<BuySellBloc, BuySellState>(
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
                  return Stack(
                    children: [
                      ListView(
                        children: [
                          Form(
                            key: formkey,
                            child: Column(
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
                                            Gap(
                                              30.h,
                                            ),
                                            SelectCurrenciesWidget(
                                              onChangedFromCurrency: (
                                                currency,
                                              ) {
                                                setState(
                                                  () {
                                                    fromAmountController
                                                        .clear();
                                                    fromCurrency = currency!;
                                                    if (toCurrency ==
                                                        currency) {
                                                      toCurrency = null;
                                                    }
                                                    fromCurrency = currency;
                                                  },
                                                );
                                              },
                                              onChangedToCurrency: (
                                                currency,
                                              ) {
                                                setState(
                                                  () {
                                                    toAmountController.clear();
                                                    toCurrency = currency;
                                                    rate = buySellResModel
                                                        .rates!
                                                        .firstWhere(
                                                          (rate) =>
                                                              fromCurrency!
                                                                      .id ==
                                                                  rate.from &&
                                                              toCurrency!.id ==
                                                                  rate.to,
                                                        )
                                                        .price!
                                                        .toInt();
                                                  },
                                                );
                                              },
                                              fromCurrency: fromCurrency,
                                              toCurrency: toCurrency,
                                              currencies:
                                                  buySellResModel.currencies,
                                            ),
                                            Gap(
                                              25.h,
                                            ),
                                            priceWidget(
                                              t: t,
                                            ),
                                            Gap(
                                              25.h,
                                            ),
                                            if (toCurrency != null)
                                              ConvertCurrencyPrice(
                                                controller:
                                                    fromAmountController,
                                                wallet: fromCurrency,
                                                onChanged: (v) {
                                                  setState(
                                                    () {
                                                      netAmount =
                                                          calculateAmount(
                                                        amount:
                                                            getIntValueFromFormatingString(
                                                                  input:
                                                                      v ?? '',
                                                                ) ??
                                                                0,
                                                        currencyCode:
                                                            fromCurrency!
                                                                .nameCode!,
                                                        rate: rate,
                                                      );
                                                      toAmountController.text =
                                                          formatter.format(
                                                        int.parse(
                                                          netAmount.toString(),
                                                        ),
                                                      );
                                                      fromAmountController
                                                              .text =
                                                          formatter.format(
                                                        int.parse(
                                                          v.toString(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            if (toCurrency != null)
                                              ConvertCurrencyPrice(
                                                controller: toAmountController,
                                                wallet: toCurrency,
                                                onChanged: (v) {
                                                  debugPrint('$v');
                                                  setState(
                                                    () {
                                                      int netAmount =
                                                          calculateAmount(
                                                        amount:
                                                            getIntValueFromFormatingString(
                                                                  input:
                                                                      v ?? '',
                                                                ) ??
                                                                0,
                                                        currencyCode:
                                                            toCurrency!
                                                                .nameCode!,
                                                        rate: rate,
                                                      );

                                                      fromAmountController
                                                              .text =
                                                          formatter.format(
                                                        int.parse(
                                                          netAmount.toString(),
                                                        ),
                                                      );
                                                      toAmountController.text =
                                                          formatter.format(
                                                        int.parse(
                                                          netAmount.toString(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Gap(
                                                  20.h,
                                                ),
                                                CustomTextFormField(
                                                  controller:
                                                      receiverAccountController,
                                                  hintText: t
                                                      .the_account_you_will_receive_the_money_from,
                                                  suffixIcon:
                                                      PopupMenuButton<Account>(
                                                    icon: const Icon(
                                                      Icons.arrow_drop_down,
                                                    ),
                                                    onSelected: (
                                                      value,
                                                    ) {
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
                                                ),
                                              ],
                                            ),
                                            Gap(
                                              20.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ButtonBuySellWidget(
                                      onTap: () async {
                                        if (formkey.currentState!.validate()) {
                                          String? errorMessage =
                                              validateTransfer(
                                            buySellResModel: buySellResModel,
                                            t: t,
                                          );
                                          if (errorMessage != null) {
                                            ToastNotifier().showError(
                                              context: context,
                                              message: errorMessage,
                                            );
                                          } else {
                                            TransferMoneyRquestmodel.instance
                                              ..senderCurrencyId =
                                                  fromCurrency!.id.toString()
                                              ..receiverCurrencyId =
                                                  toCurrency!.id
                                              ..amount =
                                                  fromAmountController.text
                                              ..rate = rate
                                              ..receiverAccount =
                                                  receiverAccountController
                                                      .text;
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
                                    Gap(
                                      30.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (buySellResModel.buySellStatus == false)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(81, 0, 0, 0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: width / 1.25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: buySellResModel.buySellMessage!,
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

  Widget priceWidget({
    required AppLocalizations t,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: t.price,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        Gap(
          20.h,
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomText(
              text: rate.toString(),
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              isPrice: true,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.error,
          ),
          onPressed: () {
            dialog(
              context,
              t,
            );
          },
        ),
      ],
    );
  }

  Future<dynamic> dialog(
    BuildContext context,
    AppLocalizations t,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomText(
            text: t.coming_soon,
            fontSize: 20.sp,
          ),
          content: CustomText(
            text: t.verification_feature_will_be_added,
            fontSize: 15.sp,
          ),
          actions: <Widget>[
            CustomTextButtonWidget(
              widget: CustomText(
                text: 'موافق',
                fontSize: 15.sp,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int calculateAmount({
    required int rate,
    required String currencyCode,
    required int amount,
  }) {
    int resultAmount = 0;
    if (currencyCode == 'SDG') {
      resultAmount = (amount / rate).toInt();
    }
    if (currencyCode == 'USDT') {
      resultAmount = (amount * rate).toInt();
    }
    if (currencyCode == 'USD') {
      resultAmount = (amount * rate).toInt();
    }
    return resultAmount;
  }

  String? validateTransfer({
    required BuySellResModel buySellResModel,
    required AppLocalizations? t,
  }) {
    int amount;
    amount = getIntValueFromFormatingString(
      input: toAmountController.text,
    )!;
    if (amount < 10) {
      return "${t?.min_transfer} 10 \$";
    }
    if (fromCurrency!.id == 2) {
      if (buySellResModel.totalMonthlyTransfers! >
          buySellResModel.monthlyTransferCount!) {
        return t?.monthly_transfer_limit;
      }

      if (buySellResModel.totalDailyTransfers! >
          buySellResModel.dailyTransferCount!) {
        return t?.daily_transfer_limit;
      }

      if (amount > buySellResModel.maxTransferCount!) {
        return "${t?.max_transfer} : ${buySellResModel.maxTransferCount.toString()}";
      }
    }
    return null;
  }
}
