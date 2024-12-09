import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/widgets/custom_text_widget.dart';
import '../../../../data/model/employee_account_res_model.dart';

class AccountInfoItemWidget extends StatelessWidget {
  AccountInfoItemWidget({
    super.key,
    required this.method,
    required this.amountController,
    required this.file,
    required this.receiveAmount,
  });

  final AccountInfo method;
  TextEditingController amountController;
  File? file;
  double receiveAmount = 0.0;
  double rate = 0.0;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
              text: method.currency?.name ?? '',
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
            ],
          ),
        ),
      ),
    );
  }
}
