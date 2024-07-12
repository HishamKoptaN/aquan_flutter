import 'package:aquan/Helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Auth/model/user.dart';

class SelectAccuWidget extends StatelessWidget {
  const SelectAccuWidget({
    super.key,
    required this.accountInfo,
    required this.onChanged,
    required this.width,
    this.id,
  });

  final List<AccountInfo>? accountInfo;
  final void Function(String?) onChanged;
  final int? id;
  final double width;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final List<DropdownMenuItem<String>> items = accountInfo!.map(
      (account) {
        String displayValue = '${account.currency} - ${account.value}';
        return DropdownMenuItem<String>(
          value: account.value,
          child: Row(
            children: [
              Text(
                "${account.currency}/" ?? '',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                account.value ?? '',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        );
      },
    ).toList();
    items.insert(
      0,
      DropdownMenuItem(
        value: 'Select',
        child: Text(
          "Select",
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
    );

    return Column(
      children: [
        SizedBox(
          width: width,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            // menuMaxHeight: 300,
            value: 'Select',
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
