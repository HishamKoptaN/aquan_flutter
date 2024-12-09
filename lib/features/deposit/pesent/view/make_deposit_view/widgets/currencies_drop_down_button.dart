// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '../../../../data/model/employee_account_res_model.dart';
// import '../make_deposit_view.dart';

// class CurrenciesDropDownButtonWidget extends StatefulWidget {
//   CurrenciesDropDownButtonWidget({
//     super.key,
//     required this.items,
//     required this.t,
//     required this.amountController,
//     required this.file,
//     required this.receiveAmount,
//   });

//   final List<DropdownMenuItem<String>>? items;
//   final AppLocalizations t;
//   TextEditingController amountController;
//   File? file;
//   double receiveAmount = 0.0;

//   @override
//   State<CurrenciesDropDownButtonWidget> createState() =>
//       _CurrenciesDropDownButtonWidgetState();
// }

// class _CurrenciesDropDownButtonWidgetState
//     extends State<CurrenciesDropDownButtonWidget> {
//   double rate = 0.0;

//   @override
//   Widget build(context) {
//     return Expanded(
//       flex: 3,
//       child: DropdownButtonFormField<String>(
//         value: null,
//         isExpanded: true,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         items: items,
//         onChanged: (value) {
//           if (value != null) {
//             setState(
//               () {
//                 currency = currencies.firstWhere(
//                   (curr) => curr.currency!.name! == value,
//                 );
//                 widget.amountController.clear();
//                 receiveAmount = 0;
//                 if (currency!.id == 1) {
//                   rate = 0;
//                 } else {
//                   rate = double.parse(
//                     employeeAccountResModel.toBinanceRates!
//                         .firstWhere(
//                           (rate) => currency!.id == rate.from,
//                         )
//                         .price
//                         .toString(),
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
