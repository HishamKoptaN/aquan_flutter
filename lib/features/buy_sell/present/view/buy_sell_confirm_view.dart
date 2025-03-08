import 'dart:io';
import 'package:aquan/all_imports.dart';
import 'package:dio/dio.dart';

class BuySellConfirmView extends StatefulWidget {
  BuySellConfirmView({
    super.key,
    required this.transferMoneyReqmodel,
  });
  TransferMoneyReqmodel transferMoneyReqmodel;
  @override
  State<BuySellConfirmView> createState() => _BuySellConfirmViewState();
}

class _BuySellConfirmViewState extends State<BuySellConfirmView> {
  File? imageFile;
  @override
  Widget build(
    context,
  ) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.buyandsell,
      showAppBar: true,
      body: BlocProvider<BuySellBloc>(
        create: (context) => BuySellBloc(
          getBuySellRatesUse: getIt(),
          getReceiveAccountNumberUseCase: getIt(),
          transferMoneyUseCase: getIt(),
        )..add(
            BuySellEvent.getReceivedAccountNumber(
              id: widget.transferMoneyReqmodel.receiverCurrencyId,
            ),
          ),
        child: BlocConsumer<BuySellBloc, BuySellState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.success,
                );

                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransactionsView(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              failure: (error) {
                ToastNotifier().showError(
                  context: context,
                  message: t.error,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              rceivedAccountNumberLoaded: (account) {
                return Column(
                  children: [
                    Gap(
                      10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: t.transferAmount,
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: widget.transferMoneyReqmodel.amount.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Gap(
                      10.h,
                    ),
                    const Divider(),
                    Gap(
                      10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: t.accountNumber,
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: account.accountNumber ?? '',
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                              ClipboardData(
                                text: account.accountNumber ?? '',
                              ),
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.copy,
                            size: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    Gap(
                      10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: t.name,
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: account.user?.firstName ?? '',
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(
                      10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: t.comment,
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(
                          20.w,
                        ),
                        CustomText(
                          text: account.comment ?? '',
                          textAlign: TextAlign.center,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    Gap(
                      10.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 100.h,
                      child: IconButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File file = File(
                              result.files.single.path!,
                            );
                            setState(
                              () {
                                imageFile = file;
                              },
                            );
                          }
                        },
                        icon: imageFile != null
                            ? Image.file(
                                fit: BoxFit.fill,
                                imageFile!,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: t.uploadPaymentProof,
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.upload,
                                    size: 28,
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Gap(
                      5.h,
                    ),
                    const Divider(),
                    Gap(
                      5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: CustomText(
                            text: t.payIn,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: TimerCountdown(
                              format: CountDownTimerFormat.minutesSeconds,
                              spacerWidth: 5,
                              colonsTextStyle: cartHeading.copyWith(
                                color: AppColors.danger,
                              ),
                              minutesDescription: "",
                              secondsDescription: "",
                              timeTextStyle: cartHeading.copyWith(
                                color: AppColors.danger,
                              ),
                              endTime: DateTime.now().add(
                                const Duration(
                                  minutes: 15,
                                  seconds: 00,
                                ),
                              ),
                              onEnd: () {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.black,
                                      onVisible: () async {
                                        await Future.delayed(
                                          const Duration(
                                            seconds: 3,
                                          ),
                                          () {
                                            setState(
                                              () {
                                                imageFile = null;
                                              },
                                            );
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomeView(),
                                                    ),
                                                    (route) => false);
                                          },
                                        );
                                      },
                                      content: Text(
                                        t.timerEnd,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(
                      10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              FormData formData = FormData.fromMap(
                                {
                                  'sender_currency_id': widget
                                      .transferMoneyReqmodel.senderCurrencyId,
                                  'receiver_currency_id': widget
                                      .transferMoneyReqmodel.receiverCurrencyId,
                                  'amount': widget.transferMoneyReqmodel.amount,
                                  'net_amount':
                                      widget.transferMoneyReqmodel.netAmount,
                                  'rate': widget.transferMoneyReqmodel.rate,
                                  'receiver_account': widget
                                      .transferMoneyReqmodel.receiverAccount,
                                  'employee_id':
                                      widget.transferMoneyReqmodel.employeeId,
                                  if (imageFile != null)
                                    'image': await MultipartFile.fromFile(
                                      imageFile!.path,
                                      filename: 'transfer_image.jpg',
                                    ),
                                },
                              );
                              context.read<BuySellBloc>().add(
                                    BuySellEvent.transferMoney(
                                      formData: formData,
                                    ),
                                  );
                            },
                            child: CustomText(
                              text: t.submit,
                              color: Colors.black,
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Gap(
                      50.h,
                    ),
                  ],
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
