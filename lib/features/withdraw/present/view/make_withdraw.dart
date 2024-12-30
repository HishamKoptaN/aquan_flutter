import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/methods/format_as_currency.dart';
import '../../../../core/models/currency.dart';
import '../../../../core/singletons/currencies_singleton.dart';
import '../../../../core/singletons/withdraw_rates_singleton.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_dropdown_button.dart';
import '../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../layouts/app_layout.dart';
import '../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../../data/model/withdraw_req_body_model.dart';
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
  WithdrawReqBodyModel? withdrawReqBodyModel = const WithdrawReqBodyModel();
  int? receiveAmount;
  TextEditingController receivingWalletController = TextEditingController();

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
                failure: (apiErrorModel) {
                  ToastNotifier().showError(
                    context: context,
                    message: apiErrorModel.error ?? t.error,
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                withdrawRatesLoaded: () {
                  final withdrawRatesResModel =
                      WithdrawRatesResSingleton.instance.withdrawRatesResModel;
                  return ListView(
                    children: [
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            CustomText(
                              text: t.withdrawMethod,
                            ),
                            Gap(
                              10.h,
                            ),
                            CustomDropdownButton<Currency>(
                              height: 50.h,
                              width: double.infinity,
                              hint: t.withdrawMethod,
                              items: CurrenciesSingleton.instance.get ?? [],
                              selectedItem:
                                  CurrenciesSingleton.instance.get?.firstWhere(
                                (currency) =>
                                    currency.id == withdrawReqBodyModel?.method,
                                orElse: () =>
                                    CurrenciesSingleton.instance.get!.first,
                              ),
                              onChanged: (v) {
                                setState(
                                  () {
                                    withdrawReqBodyModel =
                                        withdrawReqBodyModel!.copyWith(
                                      method: v?.id,
                                    );
                                    if (withdrawReqBodyModel?.method != null) {
                                      calculateReceiveAmount(
                                        getWithdrawRateApiResModel:
                                            withdrawRatesResModel!,
                                      );
                                    }
                                  },
                                );
                              },
                              itemLabel: (currency) => currency.name ?? '',
                            ),
                            Gap(
                              10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: t.commission,
                                  fontSize: 15.sp,
                                ),
                                CustomText(
                                  text: "0.0",
                                  fontSize: 15.sp,
                                ),
                              ],
                            ),
                            Gap(
                              10.h,
                            ),
                            CustomTextFormField(
                              width: double.infinity,
                              initialValue: withdrawReqBodyModel?.amount != null
                                  ? withdrawReqBodyModel?.amount.toString()
                                  : '',
                              labelText: t.withdrawAmount,
                              enabled: true,
                              suffixIcon: const Icon(
                                Icons.money,
                              ),
                              onChanged: (v) {
                                withdrawReqBodyModel =
                                    withdrawReqBodyModel?.copyWith(
                                  amount: getIntValueFromFormatingString(
                                    input: v!,
                                  ),
                                );
                                calculateReceiveAmount(
                                  getWithdrawRateApiResModel:
                                      withdrawRatesResModel!,
                                );
                              },
                              isPrice: true,
                            ),
                            Gap(
                              10.h,
                            ),
                            CustomTextFormField(
                              width: double.infinity,
                              controller: receivingWalletController,
                              labelText: t.yourWallet,
                              keyboardType: TextInputType.number,
                              onChanged: (v) {
                                withdrawReqBodyModel =
                                    withdrawReqBodyModel!.copyWith(
                                  receivingAccountNumber: int.parse(
                                    v!,
                                  ),
                                );
                              },
                            ),
                            Gap(
                              10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: t.receivedAmount,
                                ),
                                CustomText(
                                  text: receiveAmount == null
                                      ? '0'
                                      : receiveAmount.toString(),
                                  isPrice: true,
                                  showCurrencySymbol: false,
                                )
                              ],
                            ),
                            Gap(
                              20.h,
                            ),
                            CustomTextButtonWidget(
                              onPressed: () {
                                onClickSubmit(
                                  context: context,
                                  t: t,
                                  withdrawRatesResModel: withdrawRatesResModel!,
                                );
                              },
                              widget: state.maybeWhen(
                                loading: () {
                                  return const CustomCircularProgress();
                                },
                                orElse: () {
                                  return CustomText(
                                    text: t.submit,
                                    color: Colors.white,
                                    fontFamily: "Arial",
                                  );
                                },
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

  void calculateReceiveAmount({
    required WithdrawRatesResModel getWithdrawRateApiResModel,
  }) {
    setState(
      () {
        bool hasCurrencyRate = getWithdrawRateApiResModel.fromBinanceRates.any(
          (rate) => withdrawReqBodyModel?.method == rate.to,
        );
        if (hasCurrencyRate) {
          int rate = getWithdrawRateApiResModel.fromBinanceRates
              .firstWhere((rate) => withdrawReqBodyModel?.method == rate.to)
              .price;
          // احسب فقط القيمة التي سيتم استلامها بدون تعديل المبلغ الأصلي
          receiveAmount = (withdrawReqBodyModel?.amount ?? 0) * rate;
        } else {
          // إذا لم تكن هناك أسعار صرف، احتفظ بالقيمة الأصلية
          receiveAmount = withdrawReqBodyModel?.amount ?? 0;
        }
      },
    );
  }

  Future<void> onClickSubmit({
    required BuildContext context,
    required AppLocalizations t,
    required WithdrawRatesResModel withdrawRatesResModel,
  }) async {
    if (withdrawReqBodyModel!.amount! < 10) {
      ToastNotifier().showError(
        context: context,
        message: "Enter an amount greater than 10\$",
      );
    } else if (withdrawRatesResModel.totalWithdrawals >= 5000) {
      ToastNotifier().showWarning(
        context: context,
        message: t.monthly_limit_withdrawal,
      );
    }
    if (withdrawRatesResModel.totalWithdrawals >= 5000) {
      ToastNotifier().showWarning(
        context: context,
        message: t.monthly_limit_withdrawal,
      );
    }
    context.read<WithdrawsBloc>().add(
          WithdrawsEvent.addWithdraw(
            withdrawReqBodyModel: withdrawReqBodyModel!,
          ),
        );
  }
}
