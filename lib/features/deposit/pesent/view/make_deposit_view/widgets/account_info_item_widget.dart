import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/widgets/custom_text_widget.dart';
import '../../../../data/model/employee_account_res_model.dart';

class AccountInfoItemWidget extends StatelessWidget {
  AccountInfoItemWidget({
    super.key,
    required this.accountInfo,
    required this.amountToBetransfer,
    required this.isSelected,
  });

  final AccountInfo accountInfo;
  int? amountToBetransfer;
  bool isSelected;
  @override
  Widget build(
    context,
  ) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.all(
        4.sp,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            4.sp,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: accountInfo.currency?.name ?? '',
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(
                      5.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        text: t.amount_to_be_transferred,
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Gap(
                      5.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomText(
                        text: amountToBetransfer.toString(),
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.right,
                        isPrice: true,
                        showCurrencySymbol: false,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(
                      5.w,
                    ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: accountInfo.accountNumber.toString(),
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.right,
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(
                                  text: accountInfo.accountNumber!,
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
                    isSelected
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 22.sp,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const Spacer()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(
                      5.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        text: t.name,
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomText(
                        text: accountInfo.currency!.name.toString(),
                        fontSize: 12.sp,
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
                    Gap(
                      5.w,
                    ),
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
                        text: accountInfo.comment!,
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
          ),
        ),
      ),
    );
  }
}
