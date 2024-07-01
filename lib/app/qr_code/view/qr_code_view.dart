import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../Layouts/app_layout.dart';
import '../../Auth/model/user.dart';
import '../bloc/qr_code_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return AppLayout(
      route: t.qr_code,
      body: BlocProvider(
        create: (context) => UserBloc()..add(Dashboard()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is DashboardLoaded) {
              User user = state.user;
              return Center(
                child: Container(
                  height: height / 2,
                  width: width / 1.2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xFFFEEDFC),
                        Colors.white,
                        Color(0xFFE4E6F7),
                        Color(0xFFE2E5F5),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height / 3,
                        width: width / 1.5,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Colors.white,
                              Color(0xFFE4E6F7),
                              Colors.white,
                            ],
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        child: Center(
                          child: BarcodeWidget(
                            barcode:
                                Barcode.qrCode(), // Barcode type and settings
                            data: user.id.toString(),

                            height: height / 3,
                            width: width / 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // GestureDetector(
                      //   onTap: () {
                      //     BlocProvider.of<QrCodeBloc>(context)
                      //         .add(ShareQrCode());
                      //   },
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         padding: const EdgeInsets.all(12),
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: const BorderRadius.all(
                      //             Radius.circular(12),
                      //           ),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               blurRadius: 32.0,
                      //               color:
                      //                   const Color.fromARGB(255, 133, 142, 212)
                      //                       .withOpacity(0.68),
                      //             ),
                      //           ],
                      //         ),
                      //         child: const Icon(
                      //           EvaIcons.shareOutline,
                      //           color: Color(0xFF6565FF),
                      //         ),
                      //       ),
                      //       const Gap(8),
                      //       const Text(
                      //         "Share",
                      //         style: TextStyle(
                      //           fontFamily: 'poppins_semi_bold',
                      //           fontSize: 14,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                child: ListView(
                  children: [
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                    Container(
                      height: size.height * .4,
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(10),
                    ),
                    const Gap(20),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
