import 'package:aquan/features/buy_sell/bloc/buy_sell_bloc.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../core/Helpers/global_widgets.dart';
import '../../../core/Helpers/snack_bar.dart';
import '../../Widgets/convert_currency_price.dart';
import '../bloc/buy_sell_state.dart';
import 'buy_sell_confirm_view.dart';
import '../controller/buy_sell_controller.dart';
import '../model/buy_sell_model.dart';

class BuySellview extends StatefulWidget {
  const BuySellview({super.key});
  @override
  State<BuySellview> createState() => _BuySellviewState();
}

class _BuySellviewState extends State<BuySellview> {
  BuySellController buySellController = BuySellController();
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
    return AppLayout(
      route: t!.buyandsell,
      showAppBar: true,
      backArow: false,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: BlocProvider<BuySellBloc>(
          create: (context) => BuySellBloc()..add(GetCurrencies()),
          child: BlocConsumer<BuySellBloc, BuySellState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CurrenciesLoadedSuccessfully) {
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
                                                  items: state.getBuySellApiRes
                                                      .currencies
                                                      .map(
                                                    (CurrencyElement currency) {
                                                      return DropdownMenuItem<
                                                          CurrencyElement>(
                                                        value: currency,
                                                        child:
                                                            Text(currency.name),
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
                                                        rate = double.parse(state
                                                            .getBuySellApiRes
                                                            .rates
                                                            .firstWhere(
                                                              (rate) =>
                                                                  fromWallet!.id == rate.from &&
                                                                  state.getBuySellApiRes
                                                                          .userPlanId ==
                                                                      rate
                                                                          .planId &&
                                                                  toWallet!
                                                                          .id ==
                                                                      rate.to,
                                                            )
                                                            .selling);
                                                      },
                                                    );
                                                  },
                                                  items: state.getBuySellApiRes
                                                      .currencies
                                                      .where(
                                                    (CurrencyElement currency) {
                                                      return currency !=
                                                          fromWallet;
                                                    },
                                                  ).map(
                                                    (CurrencyElement currency) {
                                                      return DropdownMenuItem<
                                                          CurrencyElement>(
                                                        value: currency,
                                                        child: Text(
                                                          currency.name,
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
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Text(
                                                  NumberFormat('#,##0').format(
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
                                                      title:
                                                          const Text('مساعدة'),
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
                                              netAmount = buySellController
                                                  .calculateAmount(
                                                amount: amount,
                                                currencyCode:
                                                    fromWallet!.nameCode,
                                                rate: rate,
                                              );
                                              setState(() {
                                                toAmountController.text =
                                                    numberFormat
                                                        .format(netAmount);
                                                fromAmountController.text =
                                                    numberFormat.format(amount);
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
                                                  buySellController
                                                      .calculateAmount(
                                                amount: amount,
                                                currencyCode:
                                                    toWallet!.nameCode,
                                                rate: rate,
                                              );

                                              setState(() {
                                                fromAmountController.text =
                                                    numberFormat
                                                        .format(netAmount);
                                                toAmountController.text =
                                                    numberFormat.format(amount);
                                              });
                                            } else {
                                              setState(() {
                                                fromAmountController.text = "0";
                                              });
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
                                                label: Text(
                                                  t.accountId,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                                suffixIcon:
                                                    PopupMenuButton<Account>(
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                  ),
                                                  onSelected: (Account value) {
                                                    receiverAccountController
                                                            .text =
                                                        value.accountNumber;
                                                  },
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return state
                                                        .getBuySellApiRes
                                                        .accounts
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
                                                            '${account.currency.name} - ${account.accountNumber}',
                                                          ),
                                                        );
                                                      },
                                                    ).toList();
                                                  },
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Gap(20.h),
                                    ],
                                  ),
                                ),
                              ),
                              Gap(30.h),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (formkey.currentState!.validate()) {
                                          if (state.getBuySellApiRes
                                                  .totalMonthlyTransfers >=
                                              state.getBuySellApiRes
                                                  .monthlyTransferCount) {
                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                snackBar(
                                                  status: false,
                                                  message:
                                                      t.monthly_transfer_limit,
                                                ),
                                              );
                                          } else if (state.getBuySellApiRes
                                                  .totalDailyTransfers >=
                                              state.getBuySellApiRes
                                                  .dailyTransferCount) {
                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                snackBar(
                                                  status: false,
                                                  message:
                                                      t.daily_transfer_limit,
                                                ),
                                              );
                                          } else if (netAmount >=
                                              state.getBuySellApiRes
                                                  .maxTransferCount) {
                                            ScaffoldMessenger.of(context)
                                              ..hideCurrentSnackBar()
                                              ..showSnackBar(
                                                snackBar(
                                                  status: false,
                                                  message:
                                                      "${t.max_transfer} : ${state.getBuySellApiRes.maxTransferCount.toString()}",
                                                ),
                                              );
                                          } else if (receiverAccountController
                                              .text.isNotEmpty) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return BuySellConfirmView(
                                                    senderWallet: fromWallet!,
                                                    receiverWallet: toWallet!,
                                                    amount: fromAmountController
                                                        .text,
                                                    netAmount: netAmount,
                                                    rate: rate,
                                                    receiverAccount:
                                                        receiverAccountController
                                                            .text,
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: Container(
                                        height: 50.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              t.next,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 20.sp),
                                            ),
                                            FaIcon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                              size: 20.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          state.getBuySellApiRes.buySellStatus
                              ? const SizedBox()
                              : Center(
                                  child: Container(
                                    width: width,
                                    height: height,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(81, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 200.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: state.getBuySellApiRes
                                                .buySellMessage,
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                            maxLines: null,
                                            fontWeight: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
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
