import 'package:aquan/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/models/currency.dart';

class SelectCurrencyWidget extends StatelessWidget {
  const SelectCurrencyWidget({
    super.key,
    required this.name,
    required this.currencies,
    required this.onChanged,
    required this.size,
    this.id,
  });
  final String name;
  final List<Currency> currencies;
  final void Function(Currency?) onChanged;
  final int? id;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Row(
      children: [
        Text(
          name,
          style: cartHeading.copyWith(fontSize: 16),
        ),
        const Gap(10),
        SizedBox(
          width: size.width * 0.40 - 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField<Currency>(
              isExpanded: true,
              menuMaxHeight: 300,
              validator: (value) {
                if (value == null) {
                  return t.required;
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: currencies.map(
                (currency) {
                  return DropdownMenuItem<Currency>(
                    value: currency,
                    child: Text(
                      currency.name ?? "",
                    ),
                  );
                },
              ).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
