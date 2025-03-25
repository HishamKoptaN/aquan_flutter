import 'dart:typed_data';
import 'package:aquan/core/widgets/pick_Image_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_button_widget.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/toast_notifier.dart';
import '../../../../layouts/app_layout.dart';
import '../../../../home/home_view.dart';
import '../../../data/model/plan.dart';
import '../../bloc/plans_bloc.dart';
import '../../bloc/plans_event.dart';
import '../../bloc/plans_state.dart';
import 'plan_details_widget.dart';
import 'widget/pay_details_widget.dart';

class ChangePlanView extends StatefulWidget {
  const ChangePlanView({
    super.key,
    required this.selectedPlan,
  });
  final Plan selectedPlan;

  @override
  State<ChangePlanView> createState() => _ChangePlanViewState();
}

class _ChangePlanViewState extends State<ChangePlanView> {
  Uint8List? imageBytes;

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.changePlan,
      showAppBar: true,
      body: BlocProvider<PlansBloc>(
        create: (context) => getIt<PlansBloc>()
          ..add(
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
                        builder: (context) => const HomeView(),
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
                  '${t.transfer_commission} ${widget.selectedPlan.transferCommission.toString()}%',
                  '${t.dailyTransfers} ${widget.selectedPlan.dailyTransferCount.toString()}\$',
                  '${t.monthlyTransfers} ${widget.selectedPlan.monthlyTransferCount.toString()}\$',
                  '${t.max_transfer} ${widget.selectedPlan.maxTransferCount.toString()}\$',
                ];
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PlanDetailsWidget(
                        plan: widget.selectedPlan,
                        features: features,
                      ),
                      Gap(
                        5.h,
                      ),
                      PayDetailsWidget(
                        planRate: planRate,
                        plan: widget.selectedPlan,
                      ),
                      Gap(
                        5.h,
                      ),
                      PickImageWidget(
                        onImagePicked: (file) async {
                          setState(
                            () {
                              imageBytes = file?.readAsBytesSync();
                            },
                          );
                        },
                        label: t.uploadPaymentProof,
                      ),
                      Gap(
                        5.h,
                      ),
                      CustomTextButtonWidget(
                        onPressed: () async {
                          if (imageBytes != null) {
                            FormData formData = FormData.fromMap(
                              {
                                "plan_id": "2",
                                'currency_id': 1,
                                'image': MultipartFile.fromBytes(
                                  imageBytes!,
                                  filename: 'plan_proof_image.jpg',
                                ),
                              },
                            );
                            context.read<PlansBloc>().add(
                                  PlansEvent.change(
                                    formData: formData,
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
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        widget: state.maybeWhen(
                          loading: () {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          },
                          orElse: () {
                            return CustomText(
                              text: t.submit,
                              color: Colors.white,
                              fontFamily: "Arial",
                            );
                          },
                        ),
                      ),
                      Gap(
                        10.h,
                      ),
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
