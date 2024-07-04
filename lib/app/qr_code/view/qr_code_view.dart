import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../send_to_account/bloc/send_to_account_bloc.dart';
import '../../send_to_account/view/send_to_account_view.dart';
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
      showAppBar: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc()..add(Dashboard()),
          ),
          BlocProvider(
            create: (context) => QrCodeBloc(),
          ),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<UserBloc, UserState>(
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
                                  barcode: Barcode.qrCode(),
                                  data: user.id.toString(),
                                  height: height / 3,
                                  width: width / 2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
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
              BlocConsumer<QrCodeBloc, QrCodeState>(
                listener: (context, state) {
                  // if (state is QrCodeScannedSuccessfully) {
                  //   Navigator.of(context).pushAndRemoveUntil(
                  //       MaterialPageRoute(
                  //         builder: (context) => const SendToAccountView(),
                  //       ),
                  //       (route) => false);
                  //   context.read<UserBloc>().add(
                  //         GetNameOfUserByAccount(
                  //           accountId: state.qrCodeResult,
                  //         ),
                  //       );
                  // }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: 75.h,
                    width: 200.w,
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SendToAccountView(),
                          ),
                        );
                        context
                            .read<SendToAccountBloc>()
                            .add(ScanQrCodeEvent());
                      },
                      child: Center(
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.qrcode,
                              ),
                              Text(
                                t.scan_qr,
                                style: TextStyle(fontSize: 25.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
