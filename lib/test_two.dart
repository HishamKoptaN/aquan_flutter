// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:gap/gap.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
// import 'package:aquan/Helpers/colors.dart';
// import 'package:aquan/Helpers/styles.dart';

// class VerifyEmailView extends StatefulWidget {
//   const VerifyEmailView({
//     super.key,
//   });

//   @override
//   _VerifyEmailViewState createState() => _VerifyEmailViewState();
// }

// class _VerifyEmailViewState extends State<VerifyEmailView> {
//   bool isButtonDisabled = false;
//   Timer? countdownTimer;
//   int remainingTime = 60; // الوقت المتبقي بالثواني

//   @override
//   void dispose() {
//     countdownTimer?.cancel();
//     fields.forEach((field) {
//       field['controller'].dispose();
//       field['node'].dispose();
//     });
//     super.dispose();
//   }

//   void startTimer() {
//     setState(() {
//       isButtonDisabled = true;
//     });

//     countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (remainingTime > 0) {
//           remainingTime--;
//         } else {
//           isButtonDisabled = false;
//           countdownTimer?.cancel();
//           remainingTime = 60; // إعادة تعيين الوقت إلى 60 ثانية
//         }
//       });
//     });
//   }

//   final List<Map<String, dynamic>> fields = [
//     {'controller': TextEditingController(), 'node': FocusNode()},
//     {'controller': TextEditingController(), 'node': FocusNode()},
//     {'controller': TextEditingController(), 'node': FocusNode()},
//     {'controller': TextEditingController(), 'node': FocusNode()},
//     {'controller': TextEditingController(), 'node': FocusNode()},
//     {'controller': TextEditingController(), 'node': FocusNode()},
//   ];

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
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         t!.verifyEmail,
//                         style: cartHeading,
//                       ),
//                     ),
//                   ),
//                   const Gap(20),
//                   Center(
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         t.verifyEmailText,
//                         style: cartHeading,
//                       ),
//                     ),
//                   ),
//                   const Gap(20),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Directionality(
//                       textDirection: TextDirection.ltr,
//                       child: SizedBox(
//                         height: (size.width - 20 - 5 * 6) / 5,
//                         width: size.width,
//                         child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return const Gap(5);
//                           },
//                           separatorBuilder: (context, index) {
//                             return Container(
//                               width: (size.width - 20 - 5 * 6) / 6,
//                               height: (size.width - 20 - 5 * 6) / 6,
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context).primaryColor,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: TextFormField(
//                                 controller: fields[index]['controller'],
//                                 decoration: const InputDecoration(
//                                   border: InputBorder.none,
//                                   counterText: "",
//                                 ),
//                                 keyboardType: TextInputType.number,
//                                 onChanged: (value) {
//                                   if (index <= 5) {
//                                     FocusScope.of(context).nextFocus();
//                                   }
//                                 },
//                                 textAlign: TextAlign.center,
//                                 maxLength: 1,
//                                 showCursor: false,
//                                 style: const TextStyle(
//                                   color: white,
//                                   fontSize: 30,
//                                 ),
//                               ),
//                             );
//                           },
//                           itemCount: 7,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Gap(20),
//                   SizedBox(
//                     width: size.width - 30,
//                     child: TextButton(
//                       onPressed: () {
//                         WidgetsBinding.instance.addPostFrameCallback(
//                           (_) {
//                             String code = "";
//                             fields.every(
//                               (e) {
//                                 code = code + e['controller'].text;
//                                 return true;
//                               },
//                             );
//                             context
//                                 .read<AuthBloc>()
//                                 .add(VerifyEmail(code: code));
//                           },
//                         );
//                       },
//                       style: TextButton.styleFrom(
//                         textStyle: const TextStyle(fontSize: 20),
//                         backgroundColor: Theme.of(context).primaryColor,
//                         padding: const EdgeInsets.all(15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           side: BorderSide(
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                       child: Text(
//                         t.submit,
//                         style: const TextStyle(
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Gap(20),
//                   SizedBox(
//                     width: size.width - 30,
//                     child: isButtonDisabled
//                         ? TimerCountdown(
//                             format: CountDownTimerFormat.minutesSeconds,
//                             endTime: DateTime.now()
//                                 .add(Duration(seconds: remainingTime)),
//                             onEnd: () {
//                               setState(
//                                 () {
//                                   isButtonDisabled = false;
//                                 },
//                               );
//                             },
//                             spacerWidth: 1,
//                             timeTextStyle: const TextStyle(
//                               fontSize: 20,
//                               color: Colors.red,
//                             ),
//                           )
//                         : TextButton(
//                             onPressed: () {
//                               startTimer();
//                               // context.read<AuthBloc>().add(
//                               //       SendEmailVerification(
//                               //         email: state.user.email!,
//                               //       ),
//                               //     );
//                             },
//                             style: TextButton.styleFrom(
//                               textStyle: const TextStyle(fontSize: 20),
//                               backgroundColor: Theme.of(context).primaryColor,
//                               padding: const EdgeInsets.all(15),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 side: BorderSide(
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ),
//                             ),
//                             child: Text(
//                               t.send_verification_code,
//                               style: const TextStyle(
//                                 color: white,
//                               ),
//                             ),
//                           ),
//                   ),
//                 ],
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
