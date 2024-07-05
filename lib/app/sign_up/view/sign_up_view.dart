import 'package:aquan/app/sign_up/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/app/Auth/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Helpers/countrys_list.dart';
import '../../home_page/view/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _isoCode = "MA";

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

    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc()..add(CheckLogedIn()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrors) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: danger,
                  duration: const Duration(seconds: 3),
                  content: Text(
                    state.message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
          }

          if (state is AuthLogedIn) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
                (route) => false);
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
              backgroundColor: third,
              title: const Text(
                "AQUAN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: white,
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
              color: white,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Gap(20),
                    Text(
                      t!.createAccount,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: _name,
                      validator: validator,
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
                      validator: validator,
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
                        WidgetsBinding.instance
                            .addPostFrameCallback((_) => setState(
                                  () {
                                    _address.text = value!;
                                    _isoCode = value;
                                  },
                                ))
                      },
                    ),
                    const Gap(30),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                        trailingSpace: false,
                      ),
                      validator: validator,
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
                      validator: validator,
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
                      validator: validator,
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
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    email: _email.text,
                                    password: _password.text,
                                    name: _name.text,
                                    address: _address.text,
                                    phone: _phone.text,
                                    passwordConfirmation:
                                        _passwordConfirmation.text,
                                  ),
                                );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: (state is AuthLoading)
                            ? const CircularProgressIndicator(
                                color: white,
                              )
                            : Text(
                                t.signUp,
                                style: const TextStyle(
                                  color: white,
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
                                builder: (context) => LoginView(),
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: white,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        child: Text(
                          t.login,
                          style: const TextStyle(
                            color: black,
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
