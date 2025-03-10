import 'dart:io';
import 'package:aquan/features/deposit/pesent/bloc/deposits_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/methods/format_as_currency.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/pick_Image_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../layouts/app_layout.dart';
import '../../../../home/home_view.dart';
import '../../../data/model/employee_account_res_model.dart';
import '../../bloc/deposits_event.dart';
import '../../bloc/deposits_state.dart';
import 'widgets/account_info_item_widget.dart';

class MakeDepositView extends StatefulWidget {
  const MakeDepositView({
    super.key,
  });

  @override
  State<MakeDepositView> createState() => _MakeDepositViewState();
}

class _MakeDepositViewState extends State<MakeDepositView> {
  final formkey = GlobalKey<FormState>();
  int? amount;
  int? selectedCurrencyId;
  File? file;

  @override
  Widget build(
    BuildContext context,
  ) {
    double height = MediaQuery.of(context).size.height;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.depositMoney,
      showAppBar: true,
      body: BlocProvider<DepositsBloc>(
        create: (context) => DepositsBloc(
          getDepositstUseCase: getIt(),
          getEmployeeAccountUseCase: getIt(),
          depositUseCase: getIt(),
        )..add(
            const DepositEvent.getEmployeeAccount(),
          ),
        child: BlocConsumer<DepositsBloc, DepositsState>(
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
                    builder: (context) => const HomeView(),
                  ),
                  (route) => false,
                );
              },
              failure: (e) {
                ToastNotifier().showError(
                  context: context,
                  message: e.error ?? t.error,
                );
              },
            );
          },
          builder: (context, state) {
            state.whenOrNull(
              initial: () {
                const DepositEvent.getEmployeeAccount();
              },
            );
            return state.maybeWhen(
              employeeAccountsLoaded: (
                employeeAccountResModel,
              ) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Gap(
                          10.h,
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomTextFormField(
                            keyboardType: TextInputType.number,
                            labelText: t.amount,
                            suffixIcon: const Icon(
                              Icons.money,
                            ),
                            onChanged: (v) {
                              setState(
                                () {
                                  amount = getIntValueFromFormatingString(
                                    input: v!,
                                  );
                                },
                              );
                            },
                            isPrice: true,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: t.commission,
                                fontSize: 15.sp,
                                color: AppColors.black,
                              ),
                              CustomText(
                                text: "0.0",
                                fontSize: 15.sp,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          flex: 1,
                          child: CustomText(
                            text: t.payment_account_information,
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 16,
                          child: (employeeAccountResModel
                                      .accountInfo?.isEmpty ??
                                  true)
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: employeeAccountResModel
                                      .accountInfo!.length,
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    final AccountInfo accountInfo =
                                        employeeAccountResModel
                                            .accountInfo![index];
                                    if (_isValidCurrency(
                                      accountInfo: accountInfo,
                                      accountRes: employeeAccountResModel,
                                    )) {
                                      int? amountToBetransfer =
                                          _calculateAmountToDeposit(
                                        accountInfo: accountInfo,
                                        toBinanceRates: employeeAccountResModel
                                                .toBinanceRates ??
                                            [],
                                      );
                                      return GestureDetector(
                                        onTap: () {
                                          selectedCurrencyId =
                                              accountInfo.bankId;
                                          setState(() {});
                                        },
                                        child: AccountInfoItemWidget(
                                          accountInfo: accountInfo,
                                          amountToBetransfer: amount == null
                                              ? 0
                                              : amountToBetransfer,
                                          isSelected: accountInfo.bankId ==
                                              selectedCurrencyId,
                                        ),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                ),
                        ),
                        Gap(
                          10.h,
                        ),
                        Expanded(
                          flex: 3,
                          child: PickImageWidget(
                            onImagePicked: (image) {
                              file = image;
                            },
                            label: t.uploadPaymentProof,
                          ),
                        ),
                        Gap(
                          5.h,
                        ),
                        CustomTextButtonWidget(
                          onPressed: () {
                            onClickSubmit(
                              t: t,
                              employeeId: employeeAccountResModel.employeeId!,
                              context: context,
                            );
                          },
                          widget: state.maybeWhen(
                            loading: () {
                              return const CustomCircularProgress();
                            },
                            orElse: () {
                              return CustomText(
                                text: t.submit,
                                fontFamily: "Arial",
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
              orElse: () {
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }

  int? _calculateAmountToDeposit({
    required AccountInfo accountInfo,
    required List<ToBinanceRate> toBinanceRates,
  }) {
    if (amount == null) {
      return 0;
    } else {
      if (accountInfo.bankId == 1) {
        return amount;
      } else {
        final rate = toBinanceRates
                .firstWhere(
                  (rate) => rate.from == accountInfo.bankId,
                  orElse: () => const ToBinanceRate(
                    price: 0,
                  ),
                )
                .price ??
            0;
        return rate * amount!;
      }
    }
  }

  bool _isValidCurrency({
    required AccountInfo accountInfo,
    required EmployeeAccountResModel accountRes,
  }) {
    if (selectedCurrencyId != null && selectedCurrencyId != 1) {
      accountRes.toBinanceRates?.firstWhere(
          (rate) => selectedCurrencyId == rate.from,
          orElse: () => const ToBinanceRate(price: 0));
    }
    return !(accountInfo.currency?.id == 3 || accountInfo.currency?.id == 4);
  }

  Future<void> onClickSubmit({
    required BuildContext context,
    required AppLocalizations t,
    required int employeeId,
  }) async {
    if (amount! < 10) {
      ToastNotifier().showError(
        context: context,
        message: "Enter an amount greater than 10\$",
      );
    } else if (file == null) {
      ToastNotifier().showError(
        context: context,
        message: t.uploadPaymentProof,
      );
    } else if (selectedCurrencyId == null) {
      ToastNotifier().showError(
        context: context,
        message: t.select_deposit_method,
      );
    } else {
      FormData formData = FormData.fromMap(
        {
          'amount': amount,
          'method': selectedCurrencyId,
          'employee_id': employeeId,
          'image': await MultipartFile.fromFile(
            file!.path,
            filename: 'transfer_image.jpg',
          ),
        },
      );
      context.read<DepositsBloc>().add(
            DepositEvent.add(
              formData: formData,
            ),
          );
    }
  }
}
