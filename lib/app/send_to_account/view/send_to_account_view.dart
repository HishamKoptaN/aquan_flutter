import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';
import '../bloc/send_to_account_bloc.dart';
import '../controller/send_to_account_controller.dart';

class SendToAccountView extends StatefulWidget {
  const SendToAccountView({
    super.key,
  });

  @override
  State<SendToAccountView> createState() => _SendToAccountViewState();
}

class _SendToAccountViewState extends State<SendToAccountView> {
  SendToAccountController sendToAccountController = SendToAccountController();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.sendToAnOtherAccount,
      showAppBar: true,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SendToAccountBloc()..add(GetUSerDataEvent()),
          ),
        ],
        child: BlocConsumer<SendToAccountBloc, SendToAccountState>(
          listener: (context, state) {
            if (state is BarCodeScannedSuccessfully) {
              sendToAccountController.accountNumbertextEditingController.text =
                  state.barcodeValue;
              context.read<SendToAccountBloc>().add(
                  GetNameOfUserByAccountEvent(accountId: state.barcodeValue));
            }
            if (state is ScanQrCodeState) {
              context.read<SendToAccountBloc>().add(ScanQrCodeEvent());
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if (state is SendToAccountError)
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: danger,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  if (state is AmountSent)
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        t.amountSent,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  TextField(
                    controller: sendToAccountController
                        .accountNumbertextEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: t.accountId,
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(
                        FontAwesomeIcons.userLock,
                      ),
                    ),
                    onChanged: (value) {
                      setState(
                        () {
                          sendToAccountController
                              .accountNumbertextEditingController.text = value;
                        },
                      );
                    },
                  ),
                  const Gap(10),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      onPressed: () {
                        if (sendToAccountController
                            .accountNumbertextEditingController
                            .text
                            .isNotEmpty) {
                          context.read<SendToAccountBloc>().add(
                                GetNameOfUserByAccountEvent(
                                    accountId: sendToAccountController
                                        .accountNumbertextEditingController
                                        .text),
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: state is SendToAccountLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: black,
                              ),
                            )
                          : Text(
                              t.search,
                              style: const TextStyle(
                                color: black,
                                fontFamily: "Arial",
                              ),
                            ),
                    ),
                  ),
                  if (state is UserNameLoaded)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        state.name,
                        style: cartHeading,
                      ),
                    ),
                  const Gap(10),
                  if (state is UserNameLoaded)
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: t.amount,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.dollarSign,
                        ),
                      ),
                      onChanged: (value) {
                        setState(
                          () {
                            sendToAccountController.amount = value;
                          },
                        );
                      },
                    ),
                  const Gap(10),
                  if (state is UserNameLoaded)
                    SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                          if (sendToAccountController
                                  .accountNumbertextEditingController
                                  .text
                                  .isNotEmpty &&
                              state.name.isNotEmpty) {
                            context.read<SendToAccountBloc>().add(
                                  SendPaymentToOtherAccount(
                                      accountId: sendToAccountController
                                          .accountNumbertextEditingController
                                          .text,
                                      amount: sendToAccountController.amount),
                                );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          t.submit,
                          style: const TextStyle(
                            color: black,
                            fontFamily: "Arial",
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 75.h,
                    width: 200.w,
                    child: GestureDetector(
                      onTap: () {
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
