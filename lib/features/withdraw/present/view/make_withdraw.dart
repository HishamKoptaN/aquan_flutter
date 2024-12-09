import 'package:aquan/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/global_widgets.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/models/currency.dart';
import '../../../../core/singletons/currencies_singleton.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../layouts/app_layout.dart';
import '../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../../data/model/withdraw_request_body_model.dart';
import '../bloc/withdraws_bloc.dart';
import '../../data/model/withdraw_rates_res_model.dart';
import '../bloc/withdraws_event.dart';
import '../bloc/withdraws_state.dart';

class MakeWithdrawView extends StatefulWidget {
  const MakeWithdrawView({
    super.key,
  });

  @override
  State<MakeWithdrawView> createState() => _MakeWithdrawViewState();
}

class _MakeWithdrawViewState extends State<MakeWithdrawView> {
  final formkey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController receivingWalletController = TextEditingController();
  int? selectedcurrencyId;
  double receiveAmount = 0;

  void calculateReceiveAmount({
    required WithdrawRatesResModel getWithdrawRateApiResModel,
  }) {
    setState(
      () {
        bool hasCurrencyRate = getWithdrawRateApiResModel.fromBinanceRates.any(
          (rate) => selectedcurrencyId == rate.to,
        );
        if (hasCurrencyRate) {
          double rate = getWithdrawRateApiResModel.fromBinanceRates
              .firstWhere(
                (rate) => selectedcurrencyId == rate.to,
              )
              .price;
          receiveAmount =
              double.parse(amountController.text.replaceAll(',', '')) * rate;
          WithdrawRequestBody().amount;
        } else {
          receiveAmount =
              double.parse(amountController.text.replaceAll(',', ''));
          WithdrawRequestBody().amount;
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
        child: BlocProvider<WithdrawsBloc>(
          create: (context) => WithdrawsBloc(
            getWithdrawsUseCase: getIt(),
            getWithdrawRatesUseCase: getIt(),
            addWithdrawUseCase: getIt(),
          )..add(
              const WithdrawsEvent.getWithdrawRates(),
            ),
          child: BlocConsumer<WithdrawsBloc, WithdrawsState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  ToastNotifier().showSuccess(
                    context: context,
                    message: t.success,
                  );

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigateBarView(),
                    ),
                    (route) => false,
                  );
                },
                failure: (e) {
                  ToastNotifier().showError(
                    context: context,
                    message: t.error,
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                withdrawRatesLoaded: (
                  withdrawRatesResModel,
                ) {
                  List<DropdownMenuItem<String>> items = [];
                  var currencies = CurrenciesSingleton.instance.get;
                  if (currencies != null) {
                    currencies.every(
                      (method) {
                        items.add(
                          DropdownMenuItem(
                            value: method.name,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              method.name ?? '',
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
                  }
                  return ListView(
                    children: [
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Text(t.withdrawMethod),
                            const Gap(10),
                            DropdownButtonFormField<Currency?>(
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
                              items: CurrenciesSingleton.instance.get!.map(
                                (currency) {
                                  return DropdownMenuItem<Currency>(
                                    value: currency,
                                    child: Text(
                                      currency.name ?? "",
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  selectedcurrencyId = value.id;
                                  calculateReceiveAmount(
                                    getWithdrawRateApiResModel:
                                        withdrawRatesResModel,
                                  );
                                }
                              },
                            ),
                            Gap(
                              20.h,
                            ),
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
                            Gap(
                              20.h,
                            ),
                            CustomTextField(
                              controller: amountController,
                              label: t.withdrawAmount,
                              enabled: true,
                              icon: const Icon(
                                Icons.money,
                              ),
                              onChanged: (value) {
                                calculateReceiveAmount(
                                  getWithdrawRateApiResModel:
                                      withdrawRatesResModel,
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
                                  NumberFormat('#,###')
                                      .format(receiveAmount)
                                      .toString(),
                                  style: cartHeading,
                                )
                              ],
                            ),
                            const Gap(20),
                            SizedBox(
                              width: size.width,
                              child: TextButton(
                                onPressed: () async {
                                  if (withdrawRatesResModel.totalWithdrawals >=
                                      5000) {
                                    ToastNotifier().showWarning(
                                      context: context,
                                      message: t.monthly_limit_withdrawal,
                                    );
                                  }

                                  context.read<WithdrawsBloc>().add(
                                        WithdrawsEvent.addWithdraw(
                                          withdrawRequestBody:
                                              WithdrawRequestBody(),
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
                                child: state.maybeWhen(
                                  loading: () {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                  orElse: () {
                                    return Text(
                                      t.submit,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Arial",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
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
}
