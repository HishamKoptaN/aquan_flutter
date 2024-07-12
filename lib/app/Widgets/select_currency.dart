import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/currency/model/currency.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final void Function(int?) onChanged;
  final int? id;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final List<DropdownMenuItem<int>> items = [];

    items.add(
      DropdownMenuItem(
        value: 0,
        alignment: AlignmentDirectional.center,
        child: Text(
          t.select,
          overflow: TextOverflow.visible,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );

    for (var curr in currencies) {
      if (id != null && curr.id == id) {
        continue;
      }
      var name = curr.name;
      items.add(
        DropdownMenuItem(
          value: curr.id,
          alignment: AlignmentDirectional.center,
          child: Text(
            name!,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    }

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
            child: DropdownButtonFormField<int>(
              isExpanded: true,
              menuMaxHeight: 300,
              validator: (value) {
                if (value == null) {
                  return t.required;
                }
                return null;
              },
              value: 0,
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
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
