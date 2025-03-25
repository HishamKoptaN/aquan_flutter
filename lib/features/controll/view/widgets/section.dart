import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../data/model/section_model.dart';
import '../../present/bloc/controll_bloc.dart';
import '../../present/bloc/controll_state.dart';

class SectionAvailabilityWidget extends StatelessWidget {
  final bool canBack;
  final int sectionId;
  final Widget Function(SectionModel section) onAvailable;

  const SectionAvailabilityWidget({
    super.key,
    required this.canBack,
    required this.sectionId,
    required this.onAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControllBloc, ControllState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (sections) {
            final section = sections!.firstWhere(
              (sec) => sec.id == sectionId,
              orElse: () => SectionModel(),
            );

            if (section.status!) {
              return onAvailable(section);
            } else {
              //! إظهار محتوى الصفحة مع تراكب الرسالة
              return Stack(
                children: [
                  //! الواجهة الأصلية مع تقليل الوضوح
                  Opacity(
                    opacity: 0.4,
                    child: onAvailable(section),
                  ),
                  //! الرسالة فوق المحتوى
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //! العنوان
                            const Text(
                              "هذا القسم غير متاح حالياً!",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.h),
                            //! الرسالة
                            CustomText(
                              text: section.message ?? "يرجى المحاولة لاحقًا",
                              fontSize: 18.sp,
                              color: Colors.black,
                              maxLines: 5,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          failure: (error) => Center(
            child: Text("حدث خطأ: $error"),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
