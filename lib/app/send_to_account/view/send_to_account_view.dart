import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
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
      backArow: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SendToAccountBloc()),
        ],
        child: BlocConsumer<SendToAccountBloc, SendToAccountState>(
          listener: (context, state) {
            if (state is BarCodeScannedSuccessfully) {
              sendToAccountController.accountNumbertextEditingController.text =
                  state.barcodeValue;
              context.read<SendToAccountBloc>().add(
                    GetNameOfUserByAccountEvent(
                      accountId: state.barcodeValue,
                    ),
                  );
            }
            if (state is ScanQrCodeState) {
              context.read<SendToAccountBloc>().add(
                    ScanQrCodeEvent(),
                  );
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
                        color: Colors.green,
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
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: t.accountId,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.qr_code_scanner_sharp),
                        onPressed: () async {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) async {
                              context
                                  .read<SendToAccountBloc>()
                                  .add(ScanQrCodeEvent());
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (sendToAccountController
                          .accountNumbertextEditingController.text.isNotEmpty) {
                        context.read<SendToAccountBloc>().add(
                              GetNameOfUserByAccountEvent(
                                  accountId: sendToAccountController
                                      .accountNumbertextEditingController.text),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
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
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const Gap(10),
                  const Gap(10),
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
                      autofocus: false,
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
                                    accountNumber: sendToAccountController
                                        .accountNumbertextEditingController
                                        .text,
                                    amount: sendToAccountController.amount,
                                  ),
                                );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: amber,
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
                  const Gap(30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
