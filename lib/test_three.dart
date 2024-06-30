// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:gap/gap.dart';
// import 'package:flutter/material.dart';
// import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
// import 'package:aquan/Helpers/colors.dart';
// import 'package:aquan/Helpers/styles.dart';

// class VerifyEmailView extends StatefulWidget {
//   const VerifyEmailView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _VerifyEmailViewState createState() => _VerifyEmailViewState();
// }

// class _VerifyEmailViewState extends State<VerifyEmailView> {
//   bool isButtonDisabled = false;
//   Timer? _timer;
//   int _start = 60; // Initial countdown time in seconds

//   void startTimer() {
//     _start = 60;
//     setState(() {
//       isButtonDisabled = true;
//     });

//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (_start == 0) {
//           setState(() {
//             isButtonDisabled = false;
//           });
//           timer.cancel();
//         } else {
//           setState(() {
//             _start--;
//           });
//         }
//       },
//     );
//   }

//   final List<Map<String, dynamic>> fields = List.generate(
//       6,
//       (index) => {
//             'controller': TextEditingController(),
//             'node': FocusNode(),
//           });

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);
//     Size size = MediaQuery.of(context).size;
//     return MaterialApp(
//       home: BlocProvider<AuthBloc>(
//         create: (context) => AuthBloc()..add(CheckEmailVerification()),
//         child: BlocBuilder<AuthBloc, AuthState>(
//           builder: (BuildContext context, AuthState state) {
//             if (state is SendECodeToEmail) {
//               return Scaffold(
//                 body: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Container(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           t!.verifyEmail,
//                           style: cartHeading,
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//                     Center(
//                       child: Container(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           t.verifyEmailText,
//                           style: cartHeading,
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Directionality(
//                         textDirection: TextDirection.ltr,
//                         child: SizedBox(
//                           height: (size.width - 20 - 5 * 6) / 6,
//                           width: size.width,
//                           child: ListView.separated(
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 width: (size.width - 20 - 5 * 6) / 6,
//                                 height: (size.width - 20 - 5 * 6) / 6,
//                                 decoration: BoxDecoration(
//                                   color: Colors.amber,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: TextFormField(
//                                   controller: fields[index]['controller'],
//                                   decoration: const InputDecoration(
//                                     border: InputBorder.none,
//                                     counterText: "",
//                                   ),
//                                   keyboardType: TextInputType.number,
//                                   onChanged: (value) {
//                                     if (index < 5) {
//                                       FocusScope.of(context).nextFocus();
//                                     }
//                                   },
//                                   textAlign: TextAlign.center,
//                                   maxLength: 1,
//                                   showCursor: false,
//                                   style: const TextStyle(
//                                     color: white,
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                               );
//                             },
//                             separatorBuilder: (context, index) =>
//                                 const SizedBox(width: 5),
//                             itemCount: 6,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//                     SizedBox(
//                       width: size.width - 30,
//                       child: TextButton(
//                         onPressed: () {
//                           WidgetsBinding.instance!.addPostFrameCallback(
//                             (_) {
//                               String code = "";
//                               fields.forEach((e) {
//                                 code += e['controller'].text;
//                               });
//                               context
//                                   .read<AuthBloc>()
//                                   .add(VerifyEmail(code: code));
//                             },
//                           );
//                         },
//                         style: TextButton.styleFrom(
//                           textStyle: const TextStyle(fontSize: 20),
//                           backgroundColor: Colors.amber,
//                           padding: const EdgeInsets.all(15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             side: const BorderSide(
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ),
//                         child: Text(
//                           t.submit,
//                           style: const TextStyle(
//                             color: white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Gap(20),
//                     SizedBox(
//                       width: size.width - 30,
//                       child: TextButton(
//                         onPressed: isButtonDisabled
//                             ? null
//                             : () {
//                                 startTimer();
//                                 context.read<AuthBloc>().add(
//                                       SendEmailVerification(
//                                         email: state.user.email!,
//                                       ),
//                                     );
//                               },
//                         style: TextButton.styleFrom(
//                           textStyle: const TextStyle(fontSize: 20),
//                           backgroundColor: isButtonDisabled
//                               ? Colors.grey
//                               : Theme.of(context).primaryColor,
//                           padding: const EdgeInsets.all(15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             side: const BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               t.send_verification_code,
//                               style: const TextStyle(
//                                 color: white,
//                               ),
//                             ),
//                             if (isButtonDisabled) // Show the countdown timer if the button is disabled
//                               const SizedBox(width: 10),
//                             if (isButtonDisabled)
//                               Text(
//                                 '$_start',
//                                 style: const TextStyle(color: white),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(color: Colors.red),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
