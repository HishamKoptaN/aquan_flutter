import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../../data/model/plan.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget({
    super.key,
    required this.plan,
  });
  final Plan plan;
  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  int? selectedPlanId;
  File? file;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                t.uploadPaymentProof,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Gap(10.w),
            Expanded(
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path!);

                    setState(() {
                      file = file;
                    });
                  }
                },
                child: Container(
                  height: 150.h,
                  width: 85.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: file != null
                      ? Image.file(
                          height: 150.h,
                          width: 85.h,
                          file!,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          height: 150.h,
                          width: 85.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(t.upload),
                              Gap(5.w),
                              const FaIcon(FontAwesomeIcons.cloudArrowUp),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
