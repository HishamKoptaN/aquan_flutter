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
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
