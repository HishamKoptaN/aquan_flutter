import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/models/currency.dart';
import '../../../../../core/widgets/custom_text_widget.dart';

class SelectCurrenciesWidget extends StatefulWidget {
  SelectCurrenciesWidget({
    super.key,
    required this.onChangedFromCurrency,
    required this.onChangedToCurrency,
    required this.fromCurrency,
    required this.toCurrency,
    required this.currencies,
  });
  void Function(
    Currency?,
  )? onChangedFromCurrency;
  void Function(
    Currency?,
  )? onChangedToCurrency;
  Currency? fromCurrency;
  Currency? toCurrency;
  List<Currency>? currencies;

  @override
  State<SelectCurrenciesWidget> createState() => SelectCurrenciesWidgetState();
}

class SelectCurrenciesWidgetState extends State<SelectCurrenciesWidget> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Row(
      children: [
        Gap(
          5.w,
        ),
        CustomText(
          text: t.from,
          fontSize: 12.sp,
        ),
        Gap(
          5.w,
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1.sp,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                2.5.sp,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Currency>(
                  isExpanded: true,
                  value: widget.fromCurrency,
                  onChanged: widget.onChangedFromCurrency,
                  items: widget.currencies!.map(
                    (currency) {
                      return DropdownMenuItem<Currency>(
                        value: currency,
                        child: Text(
                          currency.name!,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
        Gap(
          5.w,
        ),
        CustomText(
          text: t.to,
          fontSize: 12.sp,
        ),
        Gap(
          5.w,
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1.sp,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                2.5.sp,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Currency>(
                  isExpanded: true,
                  value: widget.toCurrency,
                  onChanged: widget.onChangedToCurrency,
                  items: widget.currencies!.where(
                    (Currency currency) {
                      return currency != widget.fromCurrency;
                    },
                  ).map(
                    (Currency currency) {
                      return DropdownMenuItem<Currency>(
                        value: currency,
                        child: Text(
                          currency.name!,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
