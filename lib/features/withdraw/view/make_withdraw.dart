import 'package:aquan/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../core/Helpers/global_widgets.dart';
import '../../../core/utils/snack_bar.dart';
import '../../Layouts/app_layout.dart';
import '../../dash/data/model/dash_res_model.dart';
import '../../withdraws_deposits/view/withdraws_deposits_view.dart';
import '../bloc/withdraw_bloc.dart';
import '../controller/withdraw_controller.dart';
import '../model/withdraw_rate.dart';

class MakeWithdrawView extends StatefulWidget {
  const MakeWithdrawView({
    super.key,
  });

  @override
  State<MakeWithdrawView> createState() => _MakeWithdrawViewState();
}

class _MakeWithdrawViewState extends State<MakeWithdrawView> {
  final formkey = GlobalKey<FormState>();
  WithdrawController withdrawController = WithdrawController();
  TextEditingController amountController = TextEditingController();
  TextEditingController receivingWalletController = TextEditingController();
  Currency? currency;
  double receiveAmount = 0;

  get currencies => null;
  void calculateReceiveAmount({
    required GetWithdrawRateApiResModel getWithdrawRateApiResModel,
  }) {
    setState(
      () {
        bool hasCurrencyRate = getWithdrawRateApiResModel.fromBinanceRates!.any(
          (rate) => currency!.id! == rate.to,
        );
        if (hasCurrencyRate) {
          double rate = getWithdrawRateApiResModel.fromBinanceRates!
              .firstWhere(
                (rate) => currency!.id! == rate.to,
              )
              .price!;
          receiveAmount =
              double.parse(amountController.text.replaceAll(',', '')) * rate;
        } else {
          receiveAmount =
              double.parse(amountController.text.replaceAll(',', ''));
        }
      },
    );
  }

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
          create: (context) => WithdrawBloc()..add(GetWithdrawRates()),
          child: BlocConsumer<WithdrawBloc, WithdrawState>(
            listener: (context, state) {
              if (state is WithdrawCreatedSuccessfully) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: true,
                      message: t.withdrawal_sended,
                    ),
                  );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithdrawsAndDepositsView(),
                  ),
                  (route) => false,
                );
              }
              if (state is WithdrawError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: false,
                      message: state.message!,
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
              currencies.every(
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
              if (state is WithdrawRatesLoadedSuccessfully) {
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
                              currency = currencies.firstWhere(
                                (element) => element.name == value,
                              );
                              calculateReceiveAmount(
                                  getWithdrawRateApiResModel:
                                      state.getWithdrawRateApiResModel);
                            },
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.commission,
                                style: cartHeading,
                              ),
                              const Text(
                                "0.0",
                                style: cartHeading,
                              ),
                            ],
                          ),
                          const Gap(20),
                          CustomTextField(
                            controller: amountController,
                            label: t.withdrawAmount,
                            enabled: true,
                            isNumeric: true,
                            icon: const Icon(
                              Icons.money,
                            ),
                            onChanged: (value) {
                              calculateReceiveAmount(
                                getWithdrawRateApiResModel:
                                    state.getWithdrawRateApiResModel,
                              );
                            },
                          ),
                          const Gap(20),
                          TextField(
                            controller: receivingWalletController,
                            decoration: InputDecoration(
                              labelText: t.yourWallet,
                              border: const OutlineInputBorder(),
                            ),
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
                                NumberFormat('#,###').format(receiveAmount),
                                style: cartHeading,
                              )
                            ],
                          ),
                          const Gap(20),
                          SizedBox(
                            width: size.width,
                            child: TextButton(
                              onPressed: () async {
                                if (state.getWithdrawRateApiResModel
                                        .totalWithdrawals! >=
                                    5000) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar(
                                      status: false,
                                      message: t.monthly_limit_withdrawal,
                                    ),
                                  );
                                }
                                context.read<WithdrawBloc>().add(
                                      CreateWithdraw(
                                        method: currency!.id!,
                                        amount: receiveAmount,
                                        receivingWallet:
                                            receivingWalletController.text,
                                      ),
                                    );
                              },
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              child: (state is WithdrawLoading)
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      t.submit,
                                      style: const TextStyle(
                                        color: Colors.black,
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
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
