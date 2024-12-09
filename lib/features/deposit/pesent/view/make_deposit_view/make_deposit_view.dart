import 'dart:io';
import 'package:aquan/features/deposit/pesent/bloc/deposits_bloc.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/pick_Image_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../../../data/model/employee_account_res_model.dart';
import '../../bloc/deposits_event.dart';
import '../../bloc/deposits_state.dart';
import '../deposits_view/deposits_view.dart';
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
  final TextEditingController amountController = TextEditingController();
  int? selectedCurrencyId;
  double depositAmount = 0.0;
  double rate = 0.0;
  final List<AccountInfo> currencies = [];
  File? file;
  final NumberFormat formatter = NumberFormat('#,##0');
  double? receiveAmount;
  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: DropdownButtonFormField<AccountInfo>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            items: employeeAccountResModel.accountInfo?.map(
                              (accountInfo) {
                                return DropdownMenuItem<AccountInfo>(
                                  value: accountInfo,
                                  child: Text(
                                    accountInfo.currency?.name ?? "",
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(
                                  () {
                                    selectedCurrencyId = value.currency!.id;
                                    amountController.clear();
                                    receiveAmount = 0;
                                    if (selectedCurrencyId == 1) {
                                      rate = 0;
                                    } else {
                                      rate = double.parse(
                                        employeeAccountResModel.toBinanceRates!
                                            .firstWhere(
                                              (rate) =>
                                                  selectedCurrencyId ==
                                                  rate.from,
                                            )
                                            .price
                                            .toString(),
                                      );
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: t.amount,
                              border: const OutlineInputBorder(),
                              suffixIcon: const Icon(Icons.money),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]")),
                            ],
                            onChanged: (value) {
                              receiveAmount = double.parse(
                                    value,
                                  ) *
                                  rate;
                              String newValue = value.replaceAll(
                                ',',
                                '',
                              );
                              if (newValue.isNotEmpty) {
                                double parsedValue = double.parse(newValue);
                                String formattedValue = formatter.format(
                                  parsedValue,
                                );
                                setState(
                                  () {
                                    amountController.value = TextEditingValue(
                                      text: formattedValue,
                                      selection: TextSelection.collapsed(
                                        offset: formattedValue.length,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
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
                                text: rate.toString(),
                                fontSize: 15.sp,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: t.receivedAmount,
                                fontSize: 15.sp,
                                color: AppColors.black,
                              ),
                              CustomText(
                                text: receiveAmount != null
                                    ? receiveAmount!.toStringAsFixed(2)
                                    : "",
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
                          flex: 15,
                          child: employeeAccountResModel.accountInfo == null ||
                                  employeeAccountResModel.accountInfo!.isEmpty
                              ? const SizedBox.shrink()
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: employeeAccountResModel
                                      .accountInfo!.length,
                                  itemBuilder: (context, index) {
                                    AccountInfo method = employeeAccountResModel
                                        .accountInfo![index];
                                    if (method.currency == null ||
                                        method.currency!.name == null) {
                                      return const SizedBox.shrink();
                                    }
                                    // currency = currencies.firstWhere(
                                    //   (currencies) =>
                                    //       currencies.currency?.id ==
                                    //       method.currency?.id,
                                    //   orElse: () => const AccountInfo(),
                                    // );

                                    if (selectedCurrencyId != null &&
                                        selectedCurrencyId != 1) {
                                      final rateObject = employeeAccountResModel
                                          .toBinanceRates!
                                          .firstWhere(
                                        (rate) =>
                                            selectedCurrencyId == rate.from,
                                        orElse: () => const ToBinanceRate(
                                          price: 0,
                                        ),
                                      );
                                      rate = double.parse(
                                        rateObject.price.toString(),
                                      );
                                    }
                                    if (method.currency!.name == "Payeer" ||
                                        method.currency!.name ==
                                            "Perfect Money") {
                                      return const SizedBox.shrink();
                                    } else {
                                      return AccountInfoItemWidget(
                                        method: method,
                                        amountController: amountController,
                                        file: file,
                                        receiveAmount: receiveAmount ?? 0,
                                      );
                                    }
                                  },
                                ),
                        ),
                        PickImageWidget(
                          onImagePicked: (image) {
                            file = image;
                          },
                        ),
                        ButtonWidget(
                          onPressed: () async {
                            if (int.parse(amountController.text) < 10) {
                              ToastNotifier().showError(
                                context: context,
                                message: "Enter an amount greater than 10\$",
                              );
                            } else if (file == null) {
                              ToastNotifier().showError(
                                context: context,
                                message: t.uploadPaymentProof,
                              );
                            } else {
                              FormData formData = FormData.fromMap(
                                {
                                  'amount': amountController,
                                  'method': receiveAmount,
                                  'employee_id': receiveAmount,
                                  'files': await MultipartFile.fromFile(
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
                          },
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
}

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.onPressed,
  });

  void Function()? onPressed;
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return SizedBox(
      width: 150.w,
      child: TextButton(
        onPressed: onPressed,
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
        child: Text(
          t.submit,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Arial",
          ),
        ),
      ),
    );
  }
}
