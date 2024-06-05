import 'package:aquan/Currency/bloc/currency_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/Layouts/app_layout.dart';
import 'package:aquan/Models/currency.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Screens/convert_2.dart';
import 'package:aquan/Widgets/convert_currency_price.dart';
import 'package:aquan/Widgets/select_currency.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    return AppLayout(
      route: t.buyandsell,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider<CurrencyBloc>(
          create: (context) => CurrencyBloc()
            ..add(
              GetCurrencies(),
            ),
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
                          const Gap(50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            state.user.planId.toString()]
                                        [currency.id.toString()]['status'];

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
                              )
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
                          const Gap(10),
                          const Divider(),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(50),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: black.withAlpha(150),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    (sWallet != null &&
                                            dWallet != null &&
                                            sWallet!.id != dWallet!.id)
                                        ? sWallet!.rates![
                                                state.user.planId.toString()]
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
                          const Gap(20),
                          const Divider(),
                          const Gap(20),
                          if (sWallet != null)
                            ConvertCurrencyPrice(
                              controller: _fromAmount,
                              wallet: sWallet,
                              size: size,
                              onChanged: (value) {
                                if (value != null && value.isNotEmpty) {
                                  double amount = double.parse(value);
                                  double rate = double.parse(sWallet!
                                      .rates![state.user.planId.toString()]
                                          [dWallet!.id.toString()]['selling']
                                      .toString());

                                  setState(() {
                                    _toAmount.text =
                                        (amount * rate).toStringAsFixed(2);
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
                                      .rates![state.user.planId.toString()]
                                          [dWallet!.id.toString()]['selling']
                                      .toString());

                                  setState(() {
                                    _fromAmount.text =
                                        (amount / rate).toStringAsFixed(2);
                                  });
                                } else {
                                  setState(() {
                                    _fromAmount.text = "0";
                                  });
                                }
                              },
                            ),
                          const Gap(10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.accountId,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(20),
                              SizedBox(
                                width: size.width,
                                child: TextFormField(
                                  controller: _accountId,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return t.required;
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
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
                                              dWallet: dWallet!,
                                              amount: _fromAmount.text,
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        t.next,
                                        style: cartHeading,
                                      ),
                                      const Gap(10),
                                      Icon(
                                        Storage.getString('language') == 'en'
                                            ? FontAwesomeIcons.angleRight
                                            : FontAwesomeIcons.angleLeft,
                                        color: black,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Gap(100),
                        ],
                      ),
                    )
                  ],
                );
              }

              return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor),
              );
            },
          ),
        ),
      ),
    );
  }
}
