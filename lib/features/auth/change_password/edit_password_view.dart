import 'package:aquan/all_imports.dart';

class EditPassView extends StatefulWidget {
  const EditPassView({
    super.key,
  });
  @override
  State<EditPassView> createState() => _EditPassViewState();
}

class _EditPassViewState extends State<EditPassView> {
  bool loading = false;
  bool currentPasswordShow = true;
  bool passwordShow = true;
  bool passwordConfirmationShow = true;
  TextEditingController passwordController = TextEditingController();
  EditPassReqBodyModel editPassReqBodyModel = EditPassReqBodyModel();
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
                CustomTextFormPasswordField(
                  obscureText: currentPasswordShow,
                  labelText: t.currentPassword,
                  onChanged: (v) {
                    editPassReqBodyModel = editPassReqBodyModel.copyWith(
                      currentPassword: v,
                    );
                  },
                ),
                CustomTextFormPasswordField(
                  controller: passwordController,
                  obscureText: passwordShow,
                  labelText: t.newPassword,
                  onChanged: (v) {
                    editPassReqBodyModel = editPassReqBodyModel.copyWith(
                      newPassword: v,
                    );
                  },
                ),
                Gap(
                  25.h,
                ),
                CustomTextFormPasswordField(
                  obscureText: passwordConfirmationShow,
                  labelText: t.newPasswordConfirmation,
                  onChanged: (v) {
                    editPassReqBodyModel = editPassReqBodyModel.copyWith(
                      newPasswordConfirmation: v,
                    );
                  },
                ),
                Gap(
                  25.h,
                ),
                CustomTextButtonWidget(
                  onPressed: () async {
                    context.read<MainBloc>().add(
                          MainEvent.editPass(
                            editPassReqBodyModel: editPassReqBodyModel,
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
