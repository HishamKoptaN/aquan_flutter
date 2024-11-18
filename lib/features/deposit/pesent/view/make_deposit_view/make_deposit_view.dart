import 'dart:io';
import 'package:aquan/features/deposit/pesent/bloc/deposit_bloc.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/withdraws_deposits/view/withdraws_deposits_view.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../controller/deposit_controller.dart';
import '../../../data/model/employee_account_res_model.dart';
import '../../bloc/deposit_event.dart';
import '../../bloc/deposit_state.dart';

class MakeDepositView extends StatefulWidget {
  const MakeDepositView({
    super.key,
  });

  @override
  State<MakeDepositView> createState() => _MakeDepositViewState();
}

class _MakeDepositViewState extends State<MakeDepositView> {
  DepositController depositController = DepositController();
  final formkey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  AccountInfoCurrency? currency;
  double depositAmount = 0.0;
  double rate = 0.0;
  final List<AccountInfoCurrency> currencies = [];
  File? file;
  final NumberFormat formatter = NumberFormat('#,##0');
  var receiveAmount;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.depositMoney,
      showAppBar: true,
      body: BlocProvider<DepositBloc>(
        create: (context) => DepositBloc(
          getDepositstUseCase: getIt(),
          getEmployeeAccountUseCase: getIt(),
          depositUseCase: getIt(),
        )..add(
            const DepositEvent.getEmployeeAccount(),
          ),
        child: BlocConsumer<DepositBloc, DepositState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: true,
                      message: t.deposit_sended,
                    ),
                  );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithdrawsAndDepositsView(),
                  ),
                  (route) => false,
                );
              },
              failure: (e) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    snackBar(
                      status: false,
                      message: e.error!,
                    ),
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
                employeeAccountResModel.accountInfo!.every(
                  (curr) {
                    items.add(
                      DropdownMenuItem(
                        value: curr.currency!.name,
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          curr.currency!.name!,
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
                          child: DropdownButtonFormField<String>(
                            value: null,
                            isExpanded: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            items: items,
                            onChanged: (value) {
                              if (value != null) {
                                setState(
                                  () {
                                    currency = currencies.firstWhere(
                                      (curr) => curr.name == value,
                                    );
                                    amountController.clear();
                                    receiveAmount = 0;
                                    if (currency!.id == 1) {
                                      rate = 0;
                                    } else {
                                      rate = double.parse(
                                        employeeAccountResModel.toBinanceRates!
                                            .firstWhere(
                                              (rate) =>
                                                  currency!.id == rate.from,
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
                              String newValue = value.replaceAll(
                                ',',
                                '',
                              );
                              if (newValue.isNotEmpty) {
                                double parsedValue = double.parse(newValue);
                                String formattedValue =
                                    formatter.format(parsedValue);
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
                                text: "$rate",
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
                                    ? receiveAmount.toStringAsFixed(2)
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
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                employeeAccountResModel.accountInfo!.length,
                            itemBuilder: (context, index) {
                              AccountInfo method =
                                  employeeAccountResModel.accountInfo![index];
                              currency = currencies.firstWhere(
                                (curr) => curr.name == method.currency!.name,
                                orElse: () => const AccountInfoCurrency(),
                              );

                              // التحقق إذا كانت العملة غير فارغة وتعيين السعر
                              if (currency != null) {
                                if (currency!.id != 1) {
                                  // البحث عن المعدل المناسب للعملة
                                  rate = employeeAccountResModel.toBinanceRates!
                                      .firstWhere(
                                          (rate) => currency!.id == rate.from,
                                          orElse: () =>
                                              const ToBinanceRate() // تعيين سعر افتراضي
                                          )
                                      .price!;
                                }
                              }

                              // تخطي بعض العملات حسب الشرط
                              if (method.currency!.name == "Payeer" ||
                                  method.currency!.name == "Perfect Money") {
                                return const SizedBox.shrink();
                              } else {
                                return ElementWidget(
                                  method: method,
                                  t: t,
                                  amountController: amountController,
                                  file: file,
                                  receiveAmount: receiveAmount,
                                );
                              }
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
}

class ElementWidget extends StatelessWidget {
  ElementWidget({
    super.key,
    required this.method,
    required this.t,
    required this.amountController,
    required this.file,
    required this.receiveAmount,
  });

  final AccountInfo method;
  final AppLocalizations t;
  TextEditingController amountController;
  File? file;
  var receiveAmount;

  var rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: ExpansionTile(
            title: CustomText(
              text: method.currency!.name!,
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(5.w),
                      Expanded(
                        flex: 1,
                        child: CustomText(
                          text: t.amount,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: amountController.text.isNotEmpty
                              ? method.id == 1
                                  ? amountController.text
                                  : NumberFormat('#,##0').format(
                                      rate *
                                          double.parse(
                                            amountController.text.replaceAll(
                                              ',',
                                              '',
                                            ),
                                          ),
                                    )
                              : "0",
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(5.w),
                      Expanded(
                        flex: 1,
                        child: CustomText(
                          text: t.accountNumber,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            CustomText(
                              text: method.accountNumber.toString(),
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.right,
                            ),
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(
                                  ClipboardData(
                                    text: method.accountNumber!,
                                  ),
                                );
                              },
                              icon: Icon(
                                FontAwesomeIcons.copy,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(5.w),
                      Expanded(
                        flex: 1,
                        child: CustomText(
                          text: t.name,
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: method.currency!.name.toString(),
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(5.w),
                      Expanded(
                        flex: 1,
                        child: CustomText(
                          text: t.comment,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          text: method.comment!,
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(5.h),
              Column(
                children: [
                  Gap(10.h),
                  Gap(10.h),
                  ImageWidget(
                    amountController: amountController,
                    file: file,
                    t: t,
                    receiveAmount: receiveAmount,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  ImageWidget({
    super.key,
    required this.amountController,
    required this.file,
    required this.t,
    required this.receiveAmount,
  });

  TextEditingController amountController;
  File? file;
  AppLocalizations t;
  dynamic receiveAmount;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(10.h),
        InkWell(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              File file = File(
                result.files.single.path!,
              );
              setState(
                () {
                  widget.file = file;
                },
              );
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: widget.file != null
                ? Image.file(widget.file!)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.cloudArrowUp),
                      Text(
                        widget.t.uploadPaymentProof,
                      ),
                      const Gap(20),
                    ],
                  ),
          ),
        ),
        Gap(10.h),
        ButtonWidget(
          amountController: widget.amountController,
          file: widget.file,
          t: widget.t,
          receiveAmount: widget.receiveAmount,
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.amountController,
    required this.file,
    required this.t,
    required this.receiveAmount,
  });

  final TextEditingController amountController;
  final File? file;
  final AppLocalizations t;
  final dynamic receiveAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: TextButton(
        onPressed: () async {
          if (int.parse(amountController.text) < 10) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar(
                status: false,
                message: "Enter an amount greater than 10\$",
              ),
            );
          } else if (file == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar(
                status: false,
                message: t.uploadPaymentProof,
              ),
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
            context.read<DepositBloc>().add(
                  DepositEvent.add(
                    formData: formData,
                  ),
                );
          }
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
