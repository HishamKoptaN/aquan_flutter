import 'dart:io';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/Plans/bloc/plan_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../model/plan_model.dart';

class ChangePlanView extends StatefulWidget {
  const ChangePlanView({super.key, required this.plan});
  final Plan plan;

  @override
  State<ChangePlanView> createState() => _ChangePlanViewState();
}

class _ChangePlanViewState extends State<ChangePlanView> {
  File? file;
  double rate = 0.0;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.subscriptions,
      showAppBar: true,
      body: BlocProvider<PlanBloc>(
        create: (context) => PlanBloc()..add(GetPaymentMethods()),
        child: BlocConsumer<PlanBloc, PlanState>(
          listener: (context, state) {
            if (state is PlanPayedSuccessfully) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Pay Done successfully'),
                  duration: Duration(seconds: 4),
                ),
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigateBarView(),
                ),
                (route) => false,
              );
            }
            if (state is PlanError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.danger,
                  duration: const Duration(seconds: 3),
                  content: Text(
                    state.message!,
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
          builder: (context, state) {
            if (state is PlansRatesDone) {
              List<String> features = [
                '${t.transfer_commission} ${widget.plan.transferCommission.toString()}%',
                '${t.dailyTransfers} ${widget.plan.dailyTransferCount.toString()}\$',
                '${t.monthlyTransfers} ${widget.plan.monthlyTransferCount.toString()}\$',
                '${t.max_transfer} ${widget.plan.maxTransferCount.toString()}\$',
              ];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130.h,
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow[700]!,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${t.level} ${widget.plan.name}",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  widget.plan.amount > 0
                                      ? '\$${widget.plan.amount}'
                                      : t.free,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 145.h,
                            width: 170.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...features.map(
                                  (feature) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.h),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.yellow[700],
                                          size: 25.sp,
                                        ),
                                        Expanded(
                                          child: Text(
                                            feature,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.getPlansRatesApiResModel.accountInfo.length + 1,
                      itemBuilder: (context, index) {
                        if (index <
                            state.getPlansRatesApiResModel.accountInfo.length) {
                          final currency =
                              state.getPlansRatesApiResModel.accountInfo[index];
                          if (currency.id == 1) {
                            rate = 1;
                          } else {
                            rate = double.parse(
                              state.getPlansRatesApiResModel.toBinanceRates
                                  .firstWhere(
                                    (rate) => currency.id == rate.from,
                                  )
                                  .selling,
                            );
                          }
                          if (currency.bankId == 3 || currency.bankId == 4) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.all(2.w),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: ExpansionTile(
                                  title: Text(
                                    currency.currency.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  children: [
                                    Gap(5.h),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Gap(5.w),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                t.accountNumber,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    currency.accountNumber
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () async {
                                                      await Clipboard.setData(
                                                        ClipboardData(
                                                          text: currency
                                                              .accountNumber,
                                                        ),
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      FontAwesomeIcons.copy,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Gap(5.w),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                t.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                currency.currency.name
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Gap(5.w),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                t.comment,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                currency.comment,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Gap(5.w),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                t.amount,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                NumberFormat('#,##0').format(
                                                  (widget.plan.amount * rate),
                                                ),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: SizedBox(
                                    height: 50.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            t.uploadPaymentProof,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Gap(10.w),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles();
                                              if (result != null) {
                                                File file = File(
                                                    result.files.single.path!);

                                                setState(() {
                                                  this.file = file;
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 85.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              child: file != null
                                                  ? Image.file(
                                                      file!,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : SizedBox(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(t.upload),
                                                          Gap(5.w),
                                                          const FaIcon(
                                                              FontAwesomeIcons
                                                                  .cloudArrowUp),
                                                        ],
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Gap(10.h),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () {
                                      if (file != null) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback(
                                          (_) => context.read<PlanBloc>().add(
                                                PayPlan(
                                                  planId: widget.plan.id,
                                                  image: file!,
                                                  method: 2,
                                                ),
                                              ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: AppColors.danger,
                                            duration:
                                                const Duration(seconds: 3),
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
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }
}
