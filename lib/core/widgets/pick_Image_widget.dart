import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class PickImageWidget extends StatefulWidget {
  PickImageWidget({
    super.key,
    required this.onImagePicked,
    required this.label,
  });

  final Function(File? imageBytes) onImagePicked;
  String label;
  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  File? _selectedFile;

  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          final file = File(result.files.single.path!);
          setState(
            () {
              _selectedFile = file;
              widget.onImagePicked(
                file,
              );
            },
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: _selectedFile != null
            ? Image.file(
                _selectedFile!, // عرض الصورة المختارة
                fit: BoxFit.cover,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.cloudArrowUp,
                  ),
                  Text(
                    widget.label,
                  ),
                  Gap(
                    15.h,
                  ),
                ],
              ),
      ),
    );
  }
}
