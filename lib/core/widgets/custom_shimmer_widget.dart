import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: ListView(
        children: [
          Container(
            height: 100.h,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
          ),
          Gap(
            20.h,
          ),
          Container(
            height: 100.h,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
          ),
          Gap(
            20.h,
          ),
          Container(
            height: 100.h,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
          ),
          Gap(
            20.h,
          ),
          Container(
            height: 100.h,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
          ),
          Gap(
            20.h,
          ),
        ],
      ),
    );
  }
}
