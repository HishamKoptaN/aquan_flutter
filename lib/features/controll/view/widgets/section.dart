import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../data/model/section_model.dart';
import '../../present/bloc/controll_bloc.dart';
import '../../present/bloc/controll_state.dart';

class SectionAvailabilityWidget extends StatelessWidget {
  final int sectionId;
  final Widget Function(SectionModel section) onAvailable;

  const SectionAvailabilityWidget({
    super.key,
    required this.sectionId,
    required this.onAvailable,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<ControllBloc, ControllState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (
            sections,
          ) {
            final section = sections!.firstWhere(
              (sec) => sec.id == sectionId,
              orElse: () => SectionModel(),
            );
            return section.status!
                ? onAvailable(
                    section,
                  )
                : Center(
                    child: Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(81, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: width / 1.25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "هذا القسم غير متاح حالياً!",
                                    ),
                                    CustomText(
                                      text: section.message ?? '',
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      maxLines: 5,
                                      fontWeight: null,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          failure: (error) => Center(
            child: Text(
              "حدث خطأ: $error",
            ),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
