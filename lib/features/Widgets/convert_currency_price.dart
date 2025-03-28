import 'package:aquan/core/utils/styles.dart';
import 'package:aquan/features/buy_sell/data/model/buy_sell_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConvertCurrencyPrice extends StatelessWidget {
  const ConvertCurrencyPrice({
    super.key,
    required this.wallet,
    required this.size,
    required this.onChanged,
    required this.controller,
  });

  final CurrencyElement? wallet;
  final Size size;
  final void Function(String?) onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              wallet?.nameCode ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(20),
          Container(
            width: 220.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.required;
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    RegExp("[0-9.]"),
                  ),
                ],
                onChanged: onChanged,
                decoration: const InputDecoration(
                  counterStyle: cartHeading,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
