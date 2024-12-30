import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/methods/format_as_currency.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/toast_notifier.dart';
import '../../../layouts/app_layout.dart';
import '../../data/model/transfer_req_body.dart';
import '../bloc/send_to_account_bloc.dart';
import '../bloc/send_to_account_event.dart';
import '../bloc/send_to_account_state.dart';

class SendToAccountView extends StatefulWidget {
  const SendToAccountView({super.key});

  @override
  State<SendToAccountView> createState() => _SendToAccountViewState();
}

TransferReqBody transferReqBody = const TransferReqBody();

class _SendToAccountViewState extends State<SendToAccountView> {
  TextEditingController accountNumberTextEditingController =
      TextEditingController();

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
                  CustomTextFormField(
                    controller: accountNumberTextEditingController,
                    labelText: t.accountId,
                    onChanged: (v) {
                      transferReqBody = transferReqBody.copyWith(
                        accountNumber: v,
                      );
                    },
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.qr_code_scanner_sharp),
                      onPressed: () async {
                        final scannedValue = await _scanBarcode();
                        if (scannedValue != null && scannedValue.isNotEmpty) {
                          setState(
                            () {
                              accountNumberTextEditingController.text =
                                  scannedValue;
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
                                  scannedValue ?? '';
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
                  CustomTextButtonWidget(
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
                    widget: state.maybeWhen(
                      orElse: () {
                        return CustomText(
                          text: t.search,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        );
                      },
                      loading: () {
                        return const CustomCircularProgress();
                      },
                    ),
                  ),
                  Gap(
                    10.h,
                  ),
                  SizedBox(
                    child: state.maybeWhen(
                      userNameLoaded: (userNameLoaded) {
                        return Column(
                          children: [
                            CustomText(
                              text:
                                  "${userNameLoaded.firstName!} ${userNameLoaded.lastName!}",
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            Gap(
                              10.h,
                            ),
                            CustomTextFormField(
                              keyboardType: TextInputType.number,
                              labelText: t.amount,
                              suffixIcon: const Icon(
                                FontAwesomeIcons.dollarSign,
                              ),
                              isPrice: true,
                              onChanged: (v) {
                                setState(
                                  () {
                                    transferReqBody = transferReqBody.copyWith(
                                      amount: getIntValueFromFormatingString(
                                        input: v!,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Gap(
                              10.h,
                            ),
                            CustomTextButtonWidget(
                              onPressed: () async {
                                if (accountNumberTextEditingController
                                    .text.isNotEmpty) {
                                  context.read<SendToAccountBloc>().add(
                                        SendToAccountEvent
                                            .sendPaymentToOtherAccount(
                                          transferReqBody: transferReqBody,
                                        ),
                                      );
                                }
                              },
                              widget: state.maybeWhen(
                                orElse: () {
                                  return CustomText(
                                    text: t.send,
                                    fontSize: 20.sp,
                                    color: transferReqBody.amount == null
                                        ? Colors.grey
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  );
                                },
                                loading: () {
                                  return const CustomCircularProgress();
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () {
                        return const SizedBox();
                      },
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
}
