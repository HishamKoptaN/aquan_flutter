import 'package:aquan/app/buy_sell/bloc/buy_sell_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Widgets/convert_currency_price.dart';
import 'bloc/buy_sell_state.dart';
import 'buy_sell_confirm_view.dart';
import 'controller/buy_sell_controller.dart';
import 'model/buy_sell_model.dart';

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
  final TextEditingController colorController = TextEditingController();

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
        child: BlocProvider<CurrencyBloc>(
          create: (context) => CurrencyBloc()..add(GetCurrencies()),
          child: BlocConsumer<CurrencyBloc, BuySellState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CurrenciesDone) {
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
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<Currency>(
                                                  isExpanded: true,
                                                  value: buySellController
                                                      .fromWallet,
                                                  onChanged:
                                                      (Currency? newValue) {
                                                    setState(() {
                                                      buySellController
                                                              .fromWallet =
                                                          newValue;
                                                      if (buySellController
                                                              .toWallet ==
                                                          newValue) {
                                                        buySellController
                                                            .toWallet = null;
                                                      }
                                                    });
                                                    if (buySellController
                                                                .fromWallet !=
                                                            null &&
                                                        buySellController
                                                            .fromWallet!.rates!
                                                            .containsKey("1") &&
                                                        buySellController
                                                            .fromWallet!
                                                            .rates!["1"]!
                                                            .containsKey(
                                                                "1")) {}
                                                  },
                                                  items: state.currencies
                                                      .map((Currency currency) {
                                                    return DropdownMenuItem<
                                                        Currency>(
                                                      value: currency,
                                                      child:
                                                          Text(currency.name!),
                                                    );
                                                  }).toList(),
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
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<Currency>(
                                                  isExpanded: true,
                                                  value: buySellController
                                                      .toWallet,
                                                  onChanged:
                                                      (Currency? newValue) {
                                                    setState(() {
                                                      buySellController
                                                          .toWallet = newValue;
                                                    });
                                                  },
                                                  items: state.currencies.where(
                                                      (Currency currency) {
                                                    return currency !=
                                                        buySellController
                                                            .fromWallet;
                                                  }).map((Currency currency) {
                                                    return DropdownMenuItem<
                                                        Currency>(
                                                      value: currency,
                                                      child: Text(
                                                        currency.name!,
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // if (canMakeTransfer == true)
                                      //   Container(
                                      //     padding: const EdgeInsets.all(10),
                                      //     child: Text(
                                      //       t.cantMakeTransfer,
                                      //       style: const TextStyle(
                                      //         color: danger,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //     ),
                                      //   ),

                                      Gap(25.h),
                                      if (buySellController.fromWallet !=
                                              null &&
                                          buySellController.toWallet != null)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              t.price,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: black,
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
                                                  (buySellController
                                                                  .fromWallet !=
                                                              null &&
                                                          buySellController
                                                                  .toWallet !=
                                                              null)
                                                      ? buySellController
                                                          .fromWallet!
                                                          .rates![state
                                                                  .userPlanId
                                                                  .toString()]![
                                                              buySellController
                                                                  .toWallet!.id
                                                                  .toString()]!
                                                          .selling
                                                          .toString()
                                                      : "",
                                                  style: const TextStyle(
                                                    color: black,
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
                                                              'موافق'),
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
                                      if (buySellController.fromWallet !=
                                              null &&
                                          buySellController.toWallet != null)
                                        ConvertCurrencyPrice(
                                          controller: buySellController
                                              .fromAmountController,
                                          wallet: buySellController.fromWallet,
                                          size: size,
                                          onChanged: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              double amount =
                                                  double.parse(value);
                                              buySellController.rate =
                                                  double.parse(buySellController
                                                      .fromWallet!
                                                      .rates![state.userPlanId
                                                              .toString()]![
                                                          buySellController
                                                              .toWallet!.id
                                                              .toString()]!
                                                      .selling
                                                      .toString());
                                              setState(() {
                                                buySellController
                                                    .toAmountController
                                                    .text = (amount /
                                                        buySellController.rate!)
                                                    .toStringAsFixed(2);
                                              });
                                            } else {
                                              setState(() {
                                                buySellController
                                                    .toAmountController
                                                    .text = "0";
                                              });
                                            }
                                          },
                                        ),
                                      if (buySellController.fromWallet !=
                                              null &&
                                          buySellController.toWallet != null)
                                        ConvertCurrencyPrice(
                                          controller: buySellController
                                              .toAmountController,
                                          wallet: buySellController.toWallet,
                                          size: size,
                                          onChanged: (value) {
                                            if (value != null &&
                                                value.isNotEmpty) {
                                              double amount =
                                                  double.parse(value);
                                              double rate = double.parse(
                                                buySellController
                                                    .fromWallet!
                                                    .rates![state.userPlanId
                                                            .toString()]![
                                                        buySellController
                                                            .toWallet!.id
                                                            .toString()]!
                                                    .selling
                                                    .toString(),
                                              );
                                              setState(
                                                () {
                                                  buySellController
                                                          .fromAmountController
                                                          .text =
                                                      (amount / rate)
                                                          .toStringAsFixed(2);
                                                },
                                              );
                                            } else {
                                              setState(() {
                                                buySellController
                                                    .fromAmountController
                                                    .text = "0";
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
                                              controller: buySellController
                                                  .accountNumberController,
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
                                                suffixIcon: PopupMenuButton<
                                                    AccountInfo>(
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                  ),
                                                  onSelected:
                                                      (AccountInfo value) {
                                                    buySellController
                                                            .accountNumberController
                                                            .text =
                                                        value.value.toString();
                                                  },
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return state.accountInfo
                                                        .map<
                                                            PopupMenuEntry<
                                                                AccountInfo>>(
                                                      (AccountInfo
                                                          accountInfo) {
                                                        return PopupMenuItem<
                                                            AccountInfo>(
                                                          value: accountInfo,
                                                          child: Text(
                                                            '${accountInfo.currency} - ${accountInfo.value}',
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
                                          if (buySellController
                                              .accountNumberController
                                              .text
                                              .isNotEmpty) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return BuySellConfirmView(
                                                    sWallet: buySellController
                                                        .fromWallet!,
                                                    dWallet: buySellController
                                                        .toWallet!,
                                                    amount: buySellController
                                                        .fromAmountController
                                                        .text,
                                                    rate:
                                                        buySellController.rate!,
                                                    accountNumber: buySellController
                                                        .accountNumberController
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
                                                  color: black,
                                                  fontSize: 20.sp),
                                            ),
                                            FaIcon(
                                              Icons.arrow_forward_ios,
                                              color: black,
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
                          state.buySellStatus
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
                                          child: Text(
                                            "Is off now",
                                            style: TextStyle(
                                              fontSize: 25.sp,
                                            ),
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
