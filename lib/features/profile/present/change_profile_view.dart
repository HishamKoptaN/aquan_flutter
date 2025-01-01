import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/widgets/custom_circular_progress.dart';
import '../../../core/widgets/custom_text_button_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/singletons/user_singleton.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../../core/widgets/toast_notifier.dart';
import '../../layouts/app_layout.dart';
import 'bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'bloc/profile_state.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({
    super.key,
  });

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  File? file;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.changeProfile,
      showAppBar: true,
      backArow: false,
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
          editProfileUseCase: getIt(),
        ),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.success,
                );
              },
              failure: (a) {
                ToastNotifier().showError(
                  context: context,
                  message: t.error,
                );
              },
            );
          },
          builder: (context, state) {
            firstNameController = TextEditingController(
              text: UserSingleton.instance.user!.firstName,
            );
            lastNameController = TextEditingController(
              text: UserSingleton.instance.user!.lastName,
            );
            phoneController = TextEditingController(
              text: UserSingleton.instance.user!.phone,
            );
            addressController = TextEditingController(
              text: UserSingleton.instance.user!.address,
            );
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        setState(
                          () {
                            this.file = file;
                          },
                        );
                      }
                    },
                    child: Container(
                      height: 150.sp,
                      width: 150.sp,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: file != null
                              ? FileImage(
                                  file!,
                                )
                              : NetworkImage(
                                  UserSingleton.instance.user?.image ?? ""),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                          color: Colors.amber,
                          width: 6.0,
                        ),
                      ),
                    ),
                  ),
                  Gap(
                    30.h,
                  ),
                  CustomTextFormField(
                    controller: firstNameController,
                    labelText: t.first_name,
                    enabled: true,
                    suffixIcon: const Icon(
                      Icons.account_box,
                    ),
                  ),
                  Gap(
                    15.h,
                  ),
                  CustomTextFormField(
                    controller: lastNameController,
                    labelText: t.last_name,
                    enabled: true,
                    suffixIcon: const Icon(
                      Icons.account_box,
                    ),
                  ),
                  Gap(
                    15.h,
                  ),
                  CustomTextFormField(
                    controller: addressController,
                    labelText: t.address,
                    suffixIcon: const Icon(
                      Icons.location_on_outlined,
                    ),
                  ),
                  Gap(
                    15.h,
                  ),
                  CustomTextFormField(
                    controller: phoneController,
                    labelText: t.phoneNumber,
                    suffixIcon: const Icon(
                      Icons.phone,
                    ),
                  ),
                  Gap(
                    30.h,
                  ),
                  CustomTextButtonWidget(
                    onPressed: () async {
                      FormData formData = FormData.fromMap(
                        {
                          'first_name': firstNameController.text,
                          'last_name': lastNameController.text,
                          'address': addressController.text,
                          'phone': phoneController.text,
                          'image': await MultipartFile.fromFile(
                            file!.path,
                            filename: 'user_image.jpg',
                          ),
                        },
                      );
                      context.read<ProfileBloc>().add(
                            ProfileEvent.editProfile(
                              formData: formData,
                            ),
                          );
                    },
                    widget: state.maybeWhen(
                      loading: () {
                        return const CustomCircularProgress();
                      },
                      orElse: () {
                        return CustomText(
                          text: t.change,
                          color: Colors.white,
                          fontFamily: "Arial",
                        );
                      },
                    ),
                  ),
                  Gap(
                    25.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
