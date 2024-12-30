// import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class CustomCurrncyTextFormField extends StatelessWidget {
//   CustomCurrncyTextFormField({
//     super.key,
//     this.initialValue,
//     this.width,
//     this.controller,
//     this.labelText,
//     this.hint,
//     this.enabled,
//     this.suffixIcon,
//     this.onChanged,
//     this.keyboardType,
//   });
//   final String? initialValue;
//   final double? width;
//   final TextEditingController? controller;
//   final String? labelText;
//   final String? hint;
//   final Widget? suffixIcon;
//   final bool? enabled;
//   final Function(dynamic value)? onChanged;
//   TextInputType? keyboardType;

//   @override
//   Widget build(context) {
//     final t = AppLocalizations.of(context)!;
//     return SizedBox(
//       height: 75.h,
//       width: width,
//       child: TextFormField(
//         initialValue: initialValue,
//         controller: controller,
//         keyboardType: keyboardType,
//         enabled: enabled,
//         onChanged: onChanged,
//         style: TextStyle(
//           fontSize: 15.sp,
//         ),
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.black),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           suffixIcon: suffixIcon,
//           labelStyle: TextStyle(
//             fontSize: 15.sp,
//             color: Colors.black,
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//           disabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//         ),
//         inputFormatters: [
//           CurrencyTextInputFormatter.currency(
//             locale: 'en',
//             symbol: '',
//             decimalDigits: 0,
//           ),
//         ],
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return t.required;
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }
