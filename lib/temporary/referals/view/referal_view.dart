// import 'package:aquan/core/utils/app_colors.dart';
// import 'package:aquan/core/Helpers/styles.dart';
// import 'package:aquan/features/Layouts/app_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '../bloc/referals_bloc.dart';

// class ReferalView extends StatelessWidget {
//   const ReferalView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context)!;

//     return AppLayout(
//       route: t.referals,
//       showAppBar: true,
//       body: BlocProvider<ReferalsBloc>(
//         create: (context) => ReferalsBloc()..add(GetReferals()),
//         child: BlocBuilder<ReferalsBloc, ReferalsState>(
//           builder: (context, state) {
//             if (state is ReferalsLoadedSuccessfully) {
//               return ListView.builder(
//                 itemCount: state.getReferalsApiResModel.users.isEmpty
//                     ? 2
//                     : state.getReferalsApiResModel.users.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == 0) {
//                     return Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.symmetric(
//                                 vertical: 10,
//                                 horizontal: 20,
//                               ),
//                               child: Text(
//                                 t.referalCode,
//                                 style: cartHeading,
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   vertical: 10,
//                                   horizontal: 10,
//                                 ),
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     // Share.share(user.refcode!);
//                                   },
//                                   child: const Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       // Text(
//                                       //   user.refcode!,
//                                       //   textAlign: TextAlign.center,
//                                       //   style: const TextStyle(
//                                       //     color: AppColors.white,
//                                       //     fontSize: 20,
//                                       //     fontWeight: FontWeight.bold,
//                                       //   ),
//                                       // ),
//                                       FaIcon(
//                                         FontAwesomeIcons.copy,
//                                         color: Colors.white,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           margin: const EdgeInsets.symmetric(
//                             vertical: 10,
//                             horizontal: 20,
//                           ),
//                           child: Text(
//                             t.referals,
//                             style: cartHeading,
//                           ),
//                         ),
//                       ],
//                     );
//                   } else if (index == 1 &&
//                       state.getReferalsApiResModel.users.isEmpty) {
//                     return Center(
//                       child: Text(
//                         t.noReferals,
//                         style: cartHeading,
//                       ),
//                     );
//                   } else {
//                     state.getReferalsApiResModel.user =
//                         state.getReferalsApiResModel.users[index - 1];
//                     return Container(
//                       margin: const EdgeInsets.all(10),
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             state.getReferalsApiResModel.user!,
//                             style: const TextStyle(
//                               fontSize: 13,
//                             ),
//                           ),
//                           Text(
//                             state.getReferalsApiResModel.user!,
//                             style: const TextStyle(
//                               fontSize: 13,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//               );
//             }

//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }
