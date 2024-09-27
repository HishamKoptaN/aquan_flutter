import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/Helpers/styles.dart';
import '../../Layouts/app_layout.dart';
import '../bloc/send_to_account_bloc.dart';
import '../controller/send_to_account_controller.dart';

class SendToAccountView extends StatefulWidget {
  const SendToAccountView({super.key});

  @override
  State<SendToAccountView> createState() => _SendToAccountViewState();
}

class _SendToAccountViewState extends State<SendToAccountView> {
  SendToAccountController sendToAccountController = SendToAccountController();
  TextEditingController accountNumberTextEditingController =
      TextEditingController();
  String amount = "";
  bool loading = false;
  TextEditingController amountController = TextEditingController();
  String barcode = '';
  final NumberFormat formatter = NumberFormat('#,##0');

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> _scanBarcode() async {
    final scannedValue = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AiBarcodeScanner(
          onDispose: () {
            debugPrint("Barcode scanner disposed!");
          },
          hideGalleryButton: false,
          controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.noDuplicates,
          ),
          onDetect: (BarcodeCapture capture) {
            final String? scannedValue = capture.barcodes.first.rawValue;
            Navigator.pop(context, scannedValue);
            debugPrint("Barcode scanned: $scannedValue");
          },
          validator: (value) {
            if (value.barcodes.isEmpty) {
              return false;
            }
            if (!(value.barcodes.first.rawValue?.contains('flutter.dev') ??
                false)) {
              return false;
            }
            return true;
          },
        ),
      ),
    );
    return scannedValue;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.sendToAnOtherAccount,
      showAppBar: true,
      backArow: false,
      body: BlocProvider<SendToAccountBloc>(
        create: (context) => SendToAccountBloc(),
        child: BlocConsumer<SendToAccountBloc, SendToAccountState>(
          listener: (context, state) {
            if (state is ScanQrCodeState) {
              context.read<SendToAccountBloc>().add(
                    ScanQrCodeEvent(),
                  );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state is SendToAccountError)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        color: AppColors.danger,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  if (state is AmountSentSuccessfully)
                    Container(
                      width: double.infinity,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  TextField(
                    controller: accountNumberTextEditingController,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: t.accountId,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.qr_code_scanner_sharp),
                        onPressed: () async {
                          final scannedValue = await _scanBarcode();
                          if (scannedValue != null && scannedValue.isNotEmpty) {
                            setState(
                              () {
                                barcode = scannedValue;
                                accountNumberTextEditingController.text =
                                    barcode;
                              },
                            );
                            context.read<SendToAccountBloc>().add(
                                  GetNameOfUserByAccountEvent(
                                    accountNumber: scannedValue,
                                  ),
                                );
                          } else {
                            setState(
                              () {
                                accountNumberTextEditingController.text =
                                    barcode;
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (accountNumberTextEditingController.text.isNotEmpty) {
                        context.read<SendToAccountBloc>().add(
                              GetNameOfUserByAccountEvent(
                                accountNumber:
                                    accountNumberTextEditingController.text,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: state is SendToAccountLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
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
                        state.getUserByAccountApiResModel.name!,
                        style: cartHeading,
                      ),
                    ),
                  const Gap(10),
                  if (state is UserNameLoaded)
                    TextField(
                      controller: amountController,
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
                        String newValue = value.replaceAll(',', '');
                        double parsedValue = double.parse(newValue);
                        String formattedValue = formatter.format(parsedValue);
                        if (newValue.isNotEmpty) {
                          setState(
                            () {
                              amountController.value = TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.collapsed(
                                    offset: formattedValue.length),
                              );
                            },
                          );
                        }
                      },
                    ),
                  const Gap(10),
                  if (state is UserNameLoaded)
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if (accountNumberTextEditingController
                                  .text.isNotEmpty &&
                              state.getUserByAccountApiResModel.name!
                                  .isNotEmpty) {
                            context.read<SendToAccountBloc>().add(
                                  SendPaymentToOtherAccount(
                                    accountNumber:
                                        accountNumberTextEditingController.text,
                                    amount: amount,
                                  ),
                                );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                        ),
                        child: state is SendToAccountLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                t.send,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
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
