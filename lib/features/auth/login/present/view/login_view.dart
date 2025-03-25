import 'package:aquan/all_imports.dart';
import 'package:aquan/features/auth/login/data/models/firabase_login_req_body_model.dart';
import 'package:aquan/features/auth/login/data/models/reset_pass_req_body_model.dart';
import '../../../../../core/validator.dart';
import '../../../../../core/widgets/snacke_bar.dart';
import '../../../../main/present/view/main_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirabaseLoginReqBodyModel firabaseLoginReqBodyModel =
      const FirabaseLoginReqBodyModel();
  bool? validated;
  final Validator validator = Validator();
  @override
  Widget build(
    context,
  ) {
    late final AppLocalizations t = AppLocalizations.of(context)!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppLayout(
      key: const Key('login_view'),
      showAppBar: false,
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MainView(
                      ckeckEmailVeification: true,
                    ),
                  ),
                  (route) => false,
                );
              },
              failure: (
                apiErrorModel,
              ) {
                ToastNotifier().showError(
                  context: context,
                  message: apiErrorModel.error ?? t.error,
                );
              },
            );
          },
          builder: (
            context,
            state,
          ) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(
                      40.h,
                    ),
                    Image.asset(
                      'assets/icon/aquan-yellow-logo.png',
                      height: 100.h,
                      width: 100.w,
                    ),
                    CustomText(
                      text: 'أكوان',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(
                            40.h,
                          ),
                          SizedBox(
                            width: width / 1.3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text: t.sign_in,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CustomTextFormField(
                            key: const Key('email_field'),
                            onChanged: (v) {
                              firabaseLoginReqBodyModel =
                                  firabaseLoginReqBodyModel.copyWith(
                                email: v,
                              );
                              if (validated ?? false) {
                                _formKey.currentState!.validate();
                              }
                            },
                            validator: (v) => Validator.emailValidator(
                              value: v ?? '',
                              t: t,
                            ),
                            labelText: t.e_mail,
                            suffixIcon: const Icon(
                              Icons.email,
                            ),
                          ),
                          Gap(
                            20.h,
                          ),
                          CustomTextFormPasswordField(
                            key: const Key('password_field'),
                            labelText: t.password,
                            showTogglePassword: true,
                            onChanged: (
                              v,
                            ) {
                              firabaseLoginReqBodyModel =
                                  firabaseLoginReqBodyModel.copyWith(
                                password: v,
                              );
                              if (validated ?? false) {
                                _formKey.currentState!.validate();
                              }
                            },
                            validator: (
                              v,
                            ) =>
                                Validator.customValidator(
                              value: v ?? '',
                              t: t,
                            ),
                          ),
                          Gap(
                            10.h,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                if (firabaseLoginReqBodyModel.email != null) {
                                  ResetPassReqBodyModel resetPassReqBodyModel =
                                      const ResetPassReqBodyModel();
                                  resetPassReqBodyModel =
                                      resetPassReqBodyModel.copyWith(
                                    email: firabaseLoginReqBodyModel.email,
                                  );
                                  context.read<LoginBloc>().add(
                                        LoginEvent.resetPass(
                                          resetPassReqBodyModel:
                                              resetPassReqBodyModel,
                                        ),
                                      );
                                } else {
                                  CustomToast.showToast(
                                    key: Key('toast_button'),
                                    context: context,
                                    title: "أدخل البريد الالكتروني",
                                    toastType: ToastType.failure,
                                  );
                                }
                              },
                              child: CustomText(
                                text: t.forgetPassword,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Gap(
                            20.h,
                          ),
                          GestureDetector(
                            key: const Key('login_button'),
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginEvent.fireLogin(
                                        firabaseLoginReqBodyModel:
                                            firabaseLoginReqBodyModel,
                                      ),
                                    );
                              } else {
                                validated = true;
                              }
                            },
                            child: Container(
                              width: width / 2,
                              height: height / 14,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: state.maybeWhen(
                                  loading: () {
                                    return const CustomCircularProgress();
                                  },
                                  orElse: () {
                                    return Text(
                                      t.login,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Arial",
                                          fontSize: 25.sp),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Gap(
                            40.h,
                          ),
                          Row(
                            children: <Widget>[
                              const Expanded(
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: CustomText(
                                  text: t.or,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Gap(
                            20.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              state.maybeWhen(
                                loading: () {},
                                orElse: () {
                                  context.read<LoginBloc>().add(
                                        const LoginEvent.google(),
                                      );
                                },
                              );
                            },
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                  'assets/images/google_logo.png',
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: t.google,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          Gap(
                            20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignUpView(),
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: t.dont_have_account,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: t.open_account,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.blue,
                                      decorationThickness: 2.0,
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
            );
          },
        ),
      ),
    );
  }
}
