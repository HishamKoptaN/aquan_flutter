import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:motion_toast/resources/colors.dart';
import '../../Layouts/app_layout.dart';
import '../../dashboard/model/dashboard_model.dart';
import '../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../bloc/withdraw_bloc.dart';

class MakeWithdrawView extends StatefulWidget {
  const MakeWithdrawView({
    super.key,
    required this.currencies,
  });

  final List<CurrencyDashboard> currencies;

  @override
  State<MakeWithdrawView> createState() => _MakeWithdrawViewState();
}

class _MakeWithdrawViewState extends State<MakeWithdrawView> {
  final TextEditingController amount = TextEditingController();
  final TextEditingController wallet = TextEditingController();

  final formkey = GlobalKey<FormState>();
  CurrencyDashboard? currency;
  double price = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.withdrawMoney,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<WithdrawBloc>(
          create: (context) => WithdrawBloc(),
          child: BlocConsumer<WithdrawBloc, WithdrawState>(
            listener: (context, state) {
              if (state is WithdrawDone) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: successColor,
                    content: Text(
                      'Withdraw created successfully',
                    ),
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
              if (state is WithdrawError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: danger,
                      duration: const Duration(seconds: 3),
                      content: Text(
                        state.message!,
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
                (method) {
                  items.add(
                    DropdownMenuItem(
                      value: method.name,
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        method.name!,
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
                        Text(t.withdrawMethod),
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
                                  CurrencyDashboard curr =
                                      widget.currencies.firstWhere(
                                    (element) => element.name == value,
                                  );

                                  currency = curr;
                                },
                              );
                            }
                          },
                        ),
                        const Gap(20),
                        if (currency != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.amount,
                                style: cartHeading,
                              ),
                              Text(
                                "${currency!.buyingRate}",
                                style: cartHeading,
                              ),
                            ],
                          ),
                        const Gap(20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              price = double.parse(value.isEmpty ? '0' : value);
                            });
                          },
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
                          decoration: InputDecoration(
                            labelText: t.withdrawAmount,
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(
                              Icons.money,
                            ),
                          ),
                        ),
                        const Gap(20),
                        TextField(
                          controller: wallet,
                          decoration: InputDecoration(
                            labelText: t.yourWallet,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const Gap(20),
                        if (currency != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.receivedAmount,
                                style: cartHeading,
                              ),
                              Text(
                                (double.parse(currency!.buyingRate.toString()) *
                                        price)
                                    .toStringAsFixed(2),
                                style: cartHeading,
                              ),
                            ],
                          ),
                        const Gap(20),
                        SizedBox(
                          width: size.width,
                          child: TextButton(
                            onPressed: () async {
                              context.read<WithdrawBloc>().add(
                                    CreateWithdraw(
                                      amount: price,
                                      information: wallet.text,
                                      wallet: currency!.name!,
                                    ),
                                  );
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) {
                                  if (currency != null &&
                                      formkey.currentState != null) {
                                    if (formkey.currentState!.validate()) {}
                                  }
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: amber,
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: amber,
                                ),
                              ),
                            ),
                            child: (state is WithdrawLoading)
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
