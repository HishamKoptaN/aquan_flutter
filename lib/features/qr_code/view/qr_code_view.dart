import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/app_colors.dart';
import '../../Layouts/app_layout.dart';
import '../bloc/qr_code_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:typed_data';

import '../bloc/qr_code_event.dart';
import '../bloc/qr_code_state.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController = ScreenshotController();
    void shareQrCode(Uint8List screenshot) async {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/screenshot.png').create();
      await imagePath.writeAsBytes(screenshot);
      Share.shareFiles([imagePath.path], text: 'Here is my QR code');
    }

    final t = AppLocalizations.of(context)!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return AppLayout(
      route: t.qr_code,
      showAppBar: true,
      backArow: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocProvider(
              create: (context) => QrCodeBloc()..add(GetQrCodeData()),
              child: BlocBuilder<QrCodeBloc, QrCodeState>(
                builder: (context, state) {
                  if (state is QrCodeDataLoaded) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(20.h),
                          SizedBox(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Screenshot(
                                  controller: screenshotController,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(40.0),
                                            child: BarcodeWidget(
                                              barcode: Barcode.qrCode(),
                                              data:
                                                  state.user["account_number"],
                                              height: height / 3,
                                              width: width / 1.75,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -30,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'assets/icon/aquan-yellow-logo.png',
                                      height: 75.sp,
                                      width: 75.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.share),
                                  onPressed: () async {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback(
                                      (_) async {
                                        final screenshot =
                                            await screenshotController
                                                .capture();
                                        if (screenshot != null) {
                                          shareQrCode(screenshot);
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                              Text(t.share),
                            ],
                          ),
                        ],
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
          ],
        ),
      ),
    );
  }
}
