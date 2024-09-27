import 'dart:io';
import 'package:aquan/features/Plans/view/plans_view.dart';
import 'package:aquan/features/deposit/bloc/deposit_bloc.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/withdraws_deposits/view/withdraws_deposits_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../core/Helpers/snack_bar.dart';
import '../../dashboard/model/dashboard_model.dart';
import '../controller/deposit_controller.dart';

class MakeDepositView extends StatefulWidget {
  const MakeDepositView({
    super.key,
    required this.currencies,
  });
  final List<Currency> currencies;

  @override
  State<MakeDepositView> createState() => _MakeDepositViewState();
}

class _MakeDepositViewState extends State<MakeDepositView> {
  DepositController depositController = DepositController();
  final formkey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  Currency? currency;
  double depositAmount = 0.0;
  double rate = 0.0;
  File? file;
  final NumberFormat formatter = NumberFormat('#,##0');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.depositMoney,
      showAppBar: true,
      body: BlocProvider<DepositBloc>(
        create: (context) => DepositBloc()..add(GetDepositPaymentMethods()),
        child: BlocConsumer<DepositBloc, DepositState>(
          listener: (context, state) {
            if (state is DepositCreatedSuccessfully) {
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
            }
            if (state is DepositError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  snackBar(
                    status: false,
                    message: state.message,
                  ),
                );
            }
          },
          builder: (context, state) {
            if (state is DepositPaymentMethodsDone) {
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        // Expanded(
                        //   flex: 3,
                        //   child: DropdownButtonFormField<String>(
                        //     value: null,
                        //     isExpanded: true,
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //     ),
                        //     items: items,
                        //     onChanged: (value) {
                        //       if (value != null) {
                        //         setState(
                        //           () {
                        //             currency = widget.currencies.firstWhere(
                        //               (curr) => curr.name == value,
                        //             );
                        //             amountController.clear();
                        //             depositController.receiveAmount = 0;
                        //             if (currency!.id! == 1) {
                        //               depositController.rate = 0;
                        //             } else {
                        //               depositController.rate = double.parse(
                        //                 state.getEmployeeAccountApiResModel
                        //                     .toBinanceRates
                        //                     .firstWhere(
                        //                       (rate) =>
                        //                           currency!.id! == rate.from,
                        //                     )
                        //                     .selling,
                        //               );
                        //             }
                        //           },
                        //         );
                        //       }
                        //     },
                        //   ),
                        // ),
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
                              String newValue = value.replaceAll(',', '');
                              if (newValue.isNotEmpty) {
                                double parsedValue = double.parse(newValue);
                                String formattedValue =
                                    formatter.format(parsedValue);
                                setState(
                                  () {
                                    amountController.value = TextEditingValue(
                                      text: formattedValue,
                                      selection: TextSelection.collapsed(
                                          offset: formattedValue.length),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       MyText(
                        //         text: t.commission,
                        //         fontSize: 15.sp,
                        //         color:AppColors.black,
                        //       ),
                        //       MyText(
                        //         text: "${depositController.rate}",
                        //         fontSize: 15.sp,
                        //         color:AppColors.black,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       MyText(
                        //         text: t.receivedAmount,
                        //         fontSize: 15.sp,
                        //         color:AppColors.black,
                        //       ),
                        //       MyText(
                        //         text: depositController.receiveAmount
                        //             .toStringAsFixed(2),
                        //         fontSize: 15.sp,
                        //         color:AppColors.black,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const Divider(),
                        Expanded(
                          flex: 1,
                          child: MyText(
                            text: t.payment_account_information,
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.getEmployeeAccountApiResModel
                                    .accountInfo.length +
                                1,
                            itemBuilder: (context, index) {
                              if (index <
                                  state.getEmployeeAccountApiResModel
                                      .accountInfo.length) {
                                final method = state
                                    .getEmployeeAccountApiResModel
                                    .accountInfo[index];
                                currency = widget.currencies.firstWhere(
                                  (curr) => curr.name == method.currency.name,
                                );
                                if (currency!.id! == 1) {
                                } else {
                                  rate = double.parse(
                                    state.getEmployeeAccountApiResModel
                                        .toBinanceRates
                                        .firstWhere(
                                          (rate) => currency!.id! == rate.from,
                                        )
                                        .selling,
                                  );
                                }
                                if (method.currency.name == "Payeer" ||
                                    method.currency.name == "Perfect Money") {
                                  return const SizedBox.shrink();
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.all(2.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: ExpansionTile(
                                          title: MyText(
                                            text: method.currency.name,
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                          ),
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Gap(5.w),
                                                    Expanded(
                                                      flex: 1,
                                                      child: MyText(
                                                        text: t.amount,
                                                        fontSize: 12.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: MyText(
                                                        text: amountController
                                                                .text.isNotEmpty
                                                            ? currency!.id == 1
                                                                ? amountController
                                                                    .text
                                                                : NumberFormat(
                                                                        '#,##0')
                                                                    .format(
                                                                    rate *
                                                                        double
                                                                            .parse(
                                                                          amountController.text.replaceAll(
                                                                              ',',
                                                                              ''),
                                                                        ),
                                                                  )
                                                            : "0",
                                                        fontSize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Gap(5.w),
                                                    Expanded(
                                                      flex: 1,
                                                      child: MyText(
                                                        text: t.accountNumber,
                                                        fontSize: 12.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Row(
                                                        children: [
                                                          MyText(
                                                            text: method
                                                                .accountNumber
                                                                .toString(),
                                                            fontSize: 12.sp,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              await Clipboard
                                                                  .setData(
                                                                ClipboardData(
                                                                  text: method
                                                                      .accountNumber,
                                                                ),
                                                              );
                                                            },
                                                            icon: Icon(
                                                              FontAwesomeIcons
                                                                  .copy,
                                                              size: 20.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Gap(5.w),
                                                    Expanded(
                                                      flex: 1,
                                                      child: MyText(
                                                        text: t.name,
                                                        fontSize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: MyText(
                                                        text: method
                                                            .currency.name
                                                            .toString(),
                                                        fontSize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Gap(5.w),
                                                    Expanded(
                                                      flex: 1,
                                                      child: MyText(
                                                        text: t.comment,
                                                        fontSize: 12.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: MyText(
                                                        text: method.comment,
                                                        fontSize: 12.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Gap(5.h),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return Column(
                                  children: [
                                    Gap(10.h),
                                    InkWell(
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();
                                        if (result != null) {
                                          File file =
                                              File(result.files.single.path!);
                                          setState(() {
                                            this.file = file;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: file != null
                                            ? Image.file(file!)
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const FaIcon(FontAwesomeIcons
                                                      .cloudArrowUp),
                                                  Text(t.uploadPaymentProof),
                                                  const Gap(20),
                                                ],
                                              ),
                                      ),
                                    ),
                                    Gap(10.h),
                                    SizedBox(
                                      width: 150.w,
                                      child: TextButton(
                                        onPressed: () async {
                                          if (int.parse(amountController.text) <
                                              10) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              snackBar(
                                                status: false,
                                                message:
                                                    "Enter an amount greater than 10\$",
                                              ),
                                            );
                                          } else if (file == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              snackBar(
                                                status: false,
                                                message: t.uploadPaymentProof,
                                              ),
                                            );
                                          } else {
                                            context.read<DepositBloc>().add(
                                                  CreateDeposit(
                                                    file: file!,
                                                    amount: amountController,
                                                    method: currency!.id!,
                                                    employeeId: state
                                                        .getEmployeeAccountApiResModel
                                                        .employeeId!,
                                                  ),
                                                );
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                          backgroundColor: Colors.amber,
                                          padding: const EdgeInsets.all(15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: const BorderSide(
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                        child: state is DepositLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
    );
  }
}
