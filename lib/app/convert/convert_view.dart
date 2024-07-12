import 'package:aquan/app/currency/bloc/currency_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/currency/model/currency.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Widgets/convert_currency_price.dart';
import 'package:aquan/app/Widgets/select_currency.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Auth/model/user.dart';
import 'convert_2_view.dart';
import 'widgets/select_account.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  final TextEditingController _accountId = TextEditingController();
  final TextEditingController _fromAmount = TextEditingController();
  final TextEditingController _toAmount = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Currency? sWallet;
  Currency? dWallet;
  bool canMakeTransfer = true;
  int? toCurrency;
  String dropdownValue = 'One';
  final TextEditingController colorController = TextEditingController();

  @override
  void dispose() {
    _accountId.dispose();
    _fromAmount.dispose();
    _toAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    bool showSelectAccuWidget = false;
    String? selectedValue;
    return AppLayout(
      route: t.buyandsell,
      showAppBar: true,
      backArow: false,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: BlocProvider<CurrencyBloc>(
          create: (context) => CurrencyBloc()..add(GetCurrencies()),
          child: BlocConsumer<CurrencyBloc, CurrencyState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CurrenciesDone) {
                return ListView(
                  children: [
                    Form(
                      key: formkey,
                      child: Column(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SelectCurrencyWidget(
                                        // source wallet
                                        name: t.from,
                                        size: size,
                                        currencies: state.currencies,
                                        id: dWallet?.id,
                                        onChanged: (value) {
                                          if (value != 0) {
                                            Currency currency =
                                                state.currencies.firstWhere(
                                              (element) =>
                                                  element.id.toString() ==
                                                  value.toString(),
                                            );
                                            setState(() {
                                              toCurrency = currency.id;
                                              sWallet = currency;
                                            });
                                          }
                                        },
                                      ),
                                      SelectCurrencyWidget(
                                        // destination wallet
                                        name: t.to,
                                        size: size,
                                        id: toCurrency,
                                        currencies: state.currencies,
                                        onChanged: (value) {
                                          if (value != 0) {
                                            Currency currency =
                                                state.currencies.firstWhere(
                                              (element) =>
                                                  element.id.toString() ==
                                                  value.toString(),
                                            );

                                            String status = sWallet?.rates![
                                                        state.user.planId
                                                            .toString()]
                                                    [currency.id.toString()]
                                                ['status'];

                                            if (status == 'active') {
                                              setState(() {
                                                dWallet = currency;
                                                canMakeTransfer = true;
                                              });
                                            } else {
                                              setState(() {
                                                canMakeTransfer = false;
                                                dWallet = null;
                                              });
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  const Gap(10),
                                  if (canMakeTransfer == false)
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        t.cantMakeTransfer,
                                        style: const TextStyle(
                                          color: danger,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  Gap(25.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        t.price,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Gap(50.h),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            (sWallet != null &&
                                                    dWallet != null &&
                                                    sWallet!.id != dWallet!.id)
                                                ? sWallet!.rates![state
                                                            .user.planId
                                                            .toString()]
                                                        [dWallet?.id.toString()]
                                                        ['selling']
                                                    .toString()
                                                : "0",
                                            style: cartHeading,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(25.h),
                                  if (sWallet != null)
                                    ConvertCurrencyPrice(
                                      controller: _fromAmount,
                                      wallet: sWallet,
                                      size: size,
                                      onChanged: (value) {
                                        if (value != null && value.isNotEmpty) {
                                          double amount = double.parse(value);
                                          double rate = double.parse(sWallet!
                                              .rates![
                                                  state.user.planId.toString()]
                                                  [dWallet!.id.toString()]
                                                  ['selling']
                                              .toString());

                                          setState(() {
                                            _toAmount.text = (amount * rate)
                                                .toStringAsFixed(2);
                                          });
                                        } else {
                                          _toAmount.text = "0";
                                        }
                                      },
                                    ),
                                  if (dWallet != null)
                                    ConvertCurrencyPrice(
                                      controller: _toAmount,
                                      wallet: dWallet,
                                      size: size,
                                      onChanged: (value) {
                                        if (value != null && value.isNotEmpty) {
                                          double amount = double.parse(value);
                                          double rate = double.parse(sWallet!
                                              .rates![
                                                  state.user.planId.toString()]
                                                  [dWallet!.id.toString()]
                                                  ['selling']
                                              .toString());

                                          setState(() {
                                            _fromAmount.text = (amount / rate)
                                                .toStringAsFixed(2);
                                          });
                                        } else {
                                          setState(() {
                                            _fromAmount.text = "0";
                                          });
                                        }
                                      },
                                    ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                        ],
                                      ),
                                      Gap(10.h),
                                      Gap(20.h),
                                      SizedBox(
                                        width: size.width,
                                        child: TextFormField(
                                          controller: _accountId,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return t.required;
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors
                                                .white, // تحديد لون الخلفية الأبيض
                                            label: Text(
                                              t.accountId,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            suffixIcon:
                                                PopupMenuButton<AccountInfo>(
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              onSelected: (AccountInfo value) {
                                                _accountId.text =
                                                    value.value ?? "";
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return state.user.accountInfo!
                                                    .map<
                                                        PopupMenuItem<
                                                            AccountInfo>>(
                                                  (AccountInfo account) {
                                                    return PopupMenuItem<
                                                        AccountInfo>(
                                                      value: account,
                                                      child: Text(
                                                          '${account.currency} - ${account.value}'),
                                                    );
                                                  },
                                                ).toList();
                                              },
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      if (_accountId.text.isNotEmpty &&
                                          sWallet != null &&
                                          dWallet != null) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ConvertSecondScreen(
                                                accountId: _accountId.text,
                                                sWallet: sWallet!,
                                                dWallet: dWallet!, amount: '',
                                                // toAmount: _toAmount.text,
                                                // fromAmount: _fromAmount.text,
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
                                      borderRadius: BorderRadius.circular(10),
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
