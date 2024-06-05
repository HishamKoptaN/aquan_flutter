import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/Models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final Currency? wallet;
  final Size size;
  final void Function(String?) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              wallet?.nameCode ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(20),
          SizedBox(
            width: size.width * 0.5,
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
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
