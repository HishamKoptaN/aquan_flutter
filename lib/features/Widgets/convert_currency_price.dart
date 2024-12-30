import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/models/currency.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../core/widgets/custom_text_widget.dart';

class ConvertCurrencyPrice extends StatelessWidget {
  const ConvertCurrencyPrice({
    super.key,
    required this.wallet,
    required this.onChanged,
    required this.controller,
  });

  final Currency? wallet;
  final void Function(String?) onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomText(
              text: wallet?.nameCode ?? "",
              textAlign: TextAlign.center,
              color: Colors.black,
              fontSize: 22.5.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(
            10.w,
          ),
          CustomTextFormField(
            height: 50.h,
            width: 250.w,
            controller: controller,
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            isPrice: true,
          ),
        ],
      ),
    );
  }
}
