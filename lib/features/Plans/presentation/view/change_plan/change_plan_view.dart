import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:aquan/features/plans/data/model/change_plan_request_body_model.dart';
import 'package:aquan/features/plans/data/model/plan_model.dart';
import 'package:aquan/features/plans/presentation/bloc/plans_bloc.dart';
import 'package:aquan/features/plans/presentation/bloc/plans_event.dart';
import 'package:aquan/features/plans/presentation/bloc/plans_state.dart';
import 'package:aquan/features/plans/presentation/view/change_plan/plan_details_widget.dart';
import 'package:aquan/features/plans/presentation/view/change_plan/widget/pay_details_widget.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../Layouts/app_layout.dart';
import '../../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';

class ChangePlanView extends StatefulWidget {
  const ChangePlanView({
    super.key,
    required this.plan,
  });
  final Plan plan;

  @override
  State<ChangePlanView> createState() => _ChangePlanViewState();
}

class _ChangePlanViewState extends State<ChangePlanView> {
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.changePlan,
      showAppBar: true,
      body: BlocProvider<PlansBloc>(
        create: (context) => PlansBloc(
          getIt(),
          getIt(),
          getIt(),
        )..add(
            const PlansEvent.getPlansRates(),
          ),
        child: BlocConsumer<PlansBloc, PlansState>(
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
                        builder: (context) => const NavigateBarView(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              failure: (apiErrorModel) {
                ToastNotifier().showError(
                  context: context,
                  message: t.error,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              plansRatesLoaded: (planRate) {
                List<String> features = [
                  '${t.transfer_commission} ${widget.plan.transferCommission.toString()}%',
                  '${t.dailyTransfers} ${widget.plan.dailyTransferCount.toString()}\$',
                  '${t.monthlyTransfers} ${widget.plan.monthlyTransferCount.toString()}\$',
                  '${t.max_transfer} ${widget.plan.maxTransferCount.toString()}\$',
                ];
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PlanDetailsWidget(
                        t: t,
                        plan: widget.plan,
                        features: features,
                      ),
                      Gap(35.h),
                      PayDetailsWidget(
                        planRate: planRate,
                        plan: widget.plan,
                      ),
                      Container(
                        height: 150.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.hint,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
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
                                  ChangePlanRequestBodyModel().imageFile = file;
                                },
                              );
                            }
                          },
                          icon: ChangePlanRequestBodyModel().imageFile != null
                              ? Image.file(
                                  fit: BoxFit.fill,
                                  ChangePlanRequestBodyModel().imageFile!,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      t.uploadPaymentProof,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(
                                      FontAwesomeIcons.upload,
                                      size: 28,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      Gap(35.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Gap(10.h),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () async {
                                  if (ChangePlanRequestBodyModel().imageFile !=
                                      null) {
                                    FormData formData = FormData.fromMap(
                                      {
                                        'plan_invoice_id':
                                            ChangePlanRequestBodyModel()
                                                .planInvoiceId,
                                        'method':
                                            ChangePlanRequestBodyModel().method,
                                        'amount':
                                            ChangePlanRequestBodyModel().amount,
                                        if (ChangePlanRequestBodyModel()
                                                .imageFile !=
                                            null)
                                          'files': await MultipartFile.fromFile(
                                            ChangePlanRequestBodyModel()
                                                .imageFile!
                                                .path,
                                            filename: 'transfer_image.jpg',
                                          ),
                                      },
                                    );
                                    WidgetsBinding.instance
                                        .addPostFrameCallback(
                                      (_) => context.read<PlansBloc>().add(
                                            PlansEvent.change(
                                              formData: formData,
                                            ),
                                          ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.danger,
                                        duration: const Duration(seconds: 3),
                                        content: Text(
                                          t.uploadPaymentProof,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  backgroundColor: Colors.amber,
                                  padding: const EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  t.submit,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Arial",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(35.h),
                    ],
                  ),
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
