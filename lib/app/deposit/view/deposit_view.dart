import 'dart:io';

import 'package:aquan/app/deposit/bloc/deposit_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/currency/model/currency.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'deposits_withdraws_view.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen(
      {super.key, required this.currencies, required this.user});

  final List<Currency> currencies;
  final User user;

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final TextEditingController _amount = TextEditingController(text: '0');
  final formkey = GlobalKey<FormState>();

  Currency? currency;
  double? rate = 0;
  File? file;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.depositMoney,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<DepositBloc>(
          create: (context) => DepositBloc(),
          child: BlocConsumer<DepositBloc, DepositState>(
            listener: (context, state) {
              if (state is DepositDone) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            const WithdrawsAndDepositsScreen(),
                      ),
                      ModalRoute.withName('/'),
                    );
                  },
                );
              }

              if (state is DepositError) {
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
              List<DropdownMenuItem<String>>? items = [];

              items.add(
                DropdownMenuItem(
                  value: null,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    t.choose,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              );

              widget.currencies.every(
                (curr) {
                  items.add(
                    DropdownMenuItem(
                      value: curr.name,
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        curr.name!,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                  return true;
                },
              );

              return ListView(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Text(
                          t.paymentMethod,
                        ),
                        const Gap(10),
                        DropdownButtonFormField<String>(
                          value: null,
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          items: items,
                          onChanged: (value) {
                            if (value != null) {
                              setState(
                                () {
                                  currency = widget.currencies.firstWhere(
                                    (curr) => curr.name == value,
                                  );

                                  rate = double.parse(
                                      currency!.sellingRate.toString());
                                },
                              );
                            }
                          },
                        ),
                        const Gap(20),
                        TextFormField(
                          onChanged: (value) => setState(() {
                            _amount.text = value;
                          }),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: t.depositAmount,
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(
                              Icons.money,
                            ),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9.]"),
                            ),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return t.required;
                            }

                            double v = double.tryParse(value) ?? 0;

                            if (v < 10) {
                              return t.mustBe10OrHigher;
                            }

                            return null;
                          },
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.amount,
                              style: cartHeading,
                            ),
                            Text(
                              "$rate",
                              style: cartHeading,
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.receivedAmount,
                              style: cartHeading,
                            ),
                            Text(
                              (rate! *
                                      double.parse(_amount.text.isEmpty
                                          ? '0'
                                          : _amount.text))
                                  .toStringAsFixed(2),
                              style: cartHeading,
                            ),
                          ],
                        ),
                        const Gap(20),
                        if (currency != null)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Divider(),
                              Text(
                                t.paymentInfo,
                                style: cartHeading,
                              ),
                              const Gap(10),
                              Text(
                                currency!.paymentInfo!.name!,
                                style: cartHeading,
                              ),
                              const Gap(5),
                              Text(
                                currency!.paymentInfo!.accountId!,
                                style: cartHeading,
                              ),
                            ],
                          ),
                        const Gap(20),
                        InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              File file = File(result.files.single.path!);

                              setState(() {
                                this.file = file;
                              });
                            }
                          },
                          child: Container(
                            width: size.width,
                            height: 130,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: black,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(FontAwesomeIcons.cloudArrowUp),
                                const Gap(20),
                                Text(t.uploadPaymentProof),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        SizedBox(
                          width: size.width,
                          child: TextButton(
                            onPressed: () {
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) {
                                  if (file != null) {
                                    if (formkey.currentState != null &&
                                        formkey.currentState!.validate()) {
                                      context.read<DepositBloc>().add(
                                            CreateDeposit(
                                              file: file!,
                                              amount:
                                                  double.parse(_amount.text),
                                              method: currency!.name!,
                                            ),
                                          );
                                    }
                                  }
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            child: state is DepositLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: white,
                                    ),
                                  )
                                : Text(
                                    t.submit,
                                    style: const TextStyle(
                                      color: black,
                                      fontFamily: "Arial",
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}