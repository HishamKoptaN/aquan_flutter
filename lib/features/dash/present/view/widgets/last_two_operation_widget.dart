import 'package:aquan/core/singletons/trans_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../trans/present/bloc/trans_bloc.dart';
import '../../../../trans/present/bloc/trans_event.dart';
import '../../../../trans/present/bloc/trans_state.dart';

class LastTwoOperationWidget extends StatelessWidget {
  const LastTwoOperationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransBloc, TransState>(
      listener: (context, state) {
        state.whenOrNull();
      },
      builder: (context, state) {
        state.whenOrNull(
          initial: () {
            context.read<TransBloc>().add(
                  const TransEvent.get(),
                );
          },
        );
        return state.maybeWhen(
          dataLoaded: () {
            if (TransSingleton.instance.trans == null ||
                TransSingleton.instance.trans!.isEmpty) {
              return CustomText(
                text: 'لا يوجد عمليات',
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: TransSingleton.instance.trans!.length.clamp(0, 2),
              itemBuilder: (context, index) {
                final transfer = TransSingleton.instance.trans![index];
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        text: transfer.amount.toString(),
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        isPrice: true,
                      ),
                      Gap(
                        5.w,
                      ),
                      CustomText(
                        text: transfer.id.toString(),
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(
                        5.w,
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: transfer.receiverCurrency.name ?? '',
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          Gap(
                            5.h,
                          ),
                          CustomText(
                            text: transfer.createdAt,
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          orElse: () {
            return const SizedBox();
          },
          loading: () {
            return const CustomCircularProgress();
          },
        );
      },
    );
  }
}
