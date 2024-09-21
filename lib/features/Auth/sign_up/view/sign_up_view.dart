import 'package:aquan/features/Auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Helpers/countrys_list.dart';
import '../../../../Helpers/snack_bar.dart';
import '../../../navigator_bottom_bar/bottom_navigation_bar_view.dart';
import '../../login/view/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _name =
      TextEditingController(text: !kReleaseMode ? "hesham" : "");
  final TextEditingController _address =
      TextEditingController(text: !kReleaseMode ? "aiat" : "");
  final TextEditingController _phone =
      TextEditingController(text: !kReleaseMode ? "01120332361" : "");
  final TextEditingController _email = TextEditingController(
      text: !kReleaseMode ? "heshamkoptan@gmail.com" : "");
  final TextEditingController _password =
      TextEditingController(text: !kReleaseMode ? "admin" : "");
  final TextEditingController _passwordConfirmation =
      TextEditingController(text: !kReleaseMode ? "admin" : "");
  final TextEditingController _code =
      TextEditingController(text: !kReleaseMode ? "test" : "");
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _isoCode = "MA";
  bool isLoading = false;
  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    _passwordConfirmation.dispose();
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context);
    validator(String? value) {
      if (value == null) {
        return t?.required;
      }
      if (value.isEmpty) {
        return t?.required;
      }
      return null;
    }

    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessfully) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                snackBar(
                  status: true,
                  message: "Sign Up Success",
                ),
              );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigateBarView(),
              ),
              (route) => false,
            );
          }
          if (state is AuthErrors) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                snackBar(
                  status: false,
                  message: state.message!,
                ),
              );
          }
        },
        builder: (context, state) {
          List<DropdownMenuItem<String>>? countriesList = [];
          for (var country in countries) {
            countriesList.add(
              DropdownMenuItem(
                value: country['code'],
                alignment: AlignmentDirectional.center,
                child: Text(
                  country['name']!,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: AppColors.third,
              title: const Text(
                "AQUAN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              elevation: 2,
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.center,
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Gap(20),
                    Text(
                      t!.createAccount,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        labelText: t.name,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          Icons.account_box,
                        ),
                      ),
                    ),
                    const Gap(30),
                    DropdownButtonFormField<String>(
                      value: "EG",
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      items: countriesList,
                      onChanged: (value) => {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => setState(
                            () {
                              _address.text = value!;
                              _isoCode = value;
                            },
                          ),
                        )
                      },
                    ),
                    const Gap(30),
                    InternationalPhoneNumberInput(
                      onInputChanged: (number) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                        trailingSpace: false,
                      ),
                      ignoreBlank: false,
                      locale: Storage.getString('language') ?? 'en',
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: PhoneNumber(isoCode: _isoCode),
                      textFieldController: _phone,
                      hintText: t.phoneNumber,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputBorder: const OutlineInputBorder(),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _email,
                      validator: validator,
                      decoration: InputDecoration(
                        labelText: t.email,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: t.password,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          Icons.password,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _passwordConfirmation,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: t.passwordConfirmation,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          Icons.password,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _code,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: t.invitationCode,
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          Icons.abc,
                        ),
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          context.read<SignUpBloc>().add(
                                AuthSignUp(
                                  email: _email.text,
                                  password: _password.text,
                                  name: _name.text,
                                  address: _address.text,
                                  phone: _phone.text,
                                  passwordConfirmation:
                                      _passwordConfirmation.text,
                                  code: _code.text,
                                ),
                              );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: (state is SignUpLoading)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                t.signUp,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Arial",
                                ),
                              ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      alignment: Alignment.center,
                      child: Text(t.or),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Text(
                          t.login,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Arial",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
