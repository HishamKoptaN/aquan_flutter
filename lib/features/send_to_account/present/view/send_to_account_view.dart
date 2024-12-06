import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../Layouts/app_layout.dart';
import '../../data/model/transfer_request_body_model.dart';
import '../bloc/send_to_account_bloc.dart';
import '../bloc/send_to_account_event.dart';
import '../bloc/send_to_account_state.dart';

class SendToAccountView extends StatefulWidget {
  const SendToAccountView({super.key});

  @override
  State<SendToAccountView> createState() => _SendToAccountViewState();
}

class _SendToAccountViewState extends State<SendToAccountView> {
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
        create: (context) => SendToAccountBloc(
          getNameOfUserByAccountUseCase: getIt(),
          sendToAccountUseCase: getIt(),
        ),
        child: BlocConsumer<SendToAccountBloc, SendToAccountState>(
          listener: (context, state) {
            state.whenOrNull(
              amountSentSuccessfully: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.amountSent,
                );
              },
              failure: (apiErrorModel) {
                ToastNotifier().showError(
                  context: context,
                  message: apiErrorModel.error!,
                );
              },
            );
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: accountNumberTextEditingController,
                    autofocus: false,
                    onChanged: (value) {
                      TransferRequestBody().accountNumber = value;
                    },
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
                                  SendToAccountEvent.getNameOfUserByAccount(
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
                              SendToAccountEvent.getNameOfUserByAccount(
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
                    child: state.maybeWhen(
                      loading: () {
                        return const Center(
                          child: CustomCircularProgress(),
                        );
                      },
                      orElse: () {
                        return Text(
                          t.search,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
                  SizedBox(
                    child: state.maybeWhen(
                      userNameLoaded: (userNameLoaded) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            userNameLoaded.name!,
                            style: cartHeading,
                          ),
                        );
                      },
                      orElse: () {
                        return const SizedBox();
                      },
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
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
                              TransferRequestBody().amount = int.parse(
                                value,
                              );
                              amountController.value = TextEditingValue(
                                text: formattedValue,
                                selection: TextSelection.collapsed(
                                  offset: formattedValue.length,
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  Gap(
                    10.h,
                  ),
                  if (state is UserNameLoaded)
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if (accountNumberTextEditingController
                              .text.isNotEmpty) {
                            context.read<SendToAccountBloc>().add(
                                  SendToAccountEvent.sendPaymentToOtherAccount(
                                    transferRequestBody: TransferRequestBody(),
                                  ),
                                );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                        ),
                        child: state.maybeWhen(
                          loading: () {
                            return const Center(
                              child: CustomCircularProgress(),
                            );
                          },
                          orElse: () {
                            return CustomText(
                              text: t.send,
                              fontSize: 20.sp,
                              color: TransferRequestBody().amount != null
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            );
                          },
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
