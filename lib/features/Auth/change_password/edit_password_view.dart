import 'package:aquan/features/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/widgets/custom_text_button_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../../core/widgets/toast_notifier.dart';
import '../../main/data/models/edit_pass_req_body_model.dart';
import '../../main/present/bloc/main_bloc.dart';
import '../../main/present/bloc/main_event.dart';
import '../../main/present/bloc/main_state.dart';

class EditPassView extends StatefulWidget {
  const EditPassView({super.key});

  @override
  State<EditPassView> createState() => _EditPassViewState();
}

class _EditPassViewState extends State<EditPassView> {
  bool loading = false;

  bool currentPasswordShow = true;
  bool passwordShow = true;
  bool passwordConfirmationShow = true;
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.changePassword,
      showAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ToastNotifier().showSuccess(
                  context: context,
                  message: t.success,
                );
              },
              failure: (error) {
                ToastNotifier().showError(
                  context: context,
                  message: error.error!,
                );
              },
            );
          },
          builder: (context, state) {
            return ListView(
              children: [
                Gap(
                  100.h,
                ),
                CustomTextFormField(
                  obscureText: currentPasswordShow,
                  labelText: t.currentPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      currentPasswordShow
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          currentPasswordShow = !currentPasswordShow;
                        },
                      );
                    },
                  ),
                  onChanged: (value) {
                    EditPassReqBodyModel().currentPassword = value;
                  },
                ),
                Gap(
                  25.h,
                ),
                CustomTextFormField(
                  obscureText: passwordShow,
                  labelText: t.newPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordShow
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          passwordShow = !passwordShow;
                        },
                      );
                    },
                  ),
                  onChanged: (value) {
                    EditPassReqBodyModel().newPassword = value;
                  },
                ),
                Gap(
                  25.h,
                ),
                CustomTextFormField(
                  obscureText: passwordConfirmationShow,
                  labelText: t.newPasswordConfirmation,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordConfirmationShow
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          passwordConfirmationShow = !passwordConfirmationShow;
                        },
                      );
                    },
                  ),
                  onChanged: (value) {
                    EditPassReqBodyModel().newPasswordConfirmation = value;
                  },
                ),
                Gap(
                  25.h,
                ),
                CustomTextButtonWidget(
                  onPressed: () async {
                    context.read<MainBloc>().add(
                          MainEvent.editPass(
                            editPassReqBodyModel: EditPassReqBodyModel(),
                          ),
                        );
                  },
                  widget: state.maybeWhen(
                    loading: () {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
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
                  10.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
