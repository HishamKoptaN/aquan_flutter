import 'dart:io';
import 'package:aquan/Helpers/Storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Helpers/countrys_list.dart';
import 'bloc/profile_bloc.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({
    super.key,
    required this.userName,
    required this.phone,
  });

  final String userName;
  final String phone;

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  String? _name;
  String? _phone;

  final TextEditingController _address = TextEditingController();
  String? _isoCode;

  bool loading = false;

  @override
  void initState() {
    _name = widget.userName;
    _phone = widget.phone;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          t.changeProfile,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: size.width,
        child: BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc()..add(GetProfileUser()),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: danger,
                      duration: const Duration(seconds: 3),
                      content: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
              }
            },
            builder: (context, state) {
              String? error;
              if (state is ProfileError) {
                error = state.message;
              }
              if (state is ProfileDone) {
                List<DropdownMenuItem<String>> countriesList = [];

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
                String? defaultValue = countries.any(
                        (country) => country['code'] == state.data['address'])
                    ? state.data['address']
                    : null;

                return ListView(
                  children: [
                    if (error != null)
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: danger,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          error,
                          style: const TextStyle(
                            color: white,
                          ),
                        ),
                      ),
                    if (state.updated)
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: successColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          t.profileChangedSuccess,
                          style: const TextStyle(
                            color: white,
                          ),
                        ),
                      ),
                    const Gap(50),
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              File file = File(result.files.single.path!);
                              WidgetsBinding.instance.addPostFrameCallback(
                                (_) => context
                                    .read<ProfileBloc>()
                                    .add(ChangeProfileImage(file: file)),
                              );
                            }
                          },
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: amber,
                              image: DecorationImage(
                                image: NetworkImage(state.data['image'] ?? ""),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100.0),
                              ),
                              border: Border.all(
                                color: amber,
                                width: 6.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    SizedBox(
                      width: size.width,
                      child: TextFormField(
                        initialValue: _name,
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: t.name,
                          border: const OutlineInputBorder(),
                          suffixIcon: const Icon(
                            Icons.account_box,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    DropdownButtonFormField<String>(
                      value: defaultValue,
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
                      onChanged: (value) {
                        setState(() {
                          _address.text = value!;
                          _isoCode = value;
                        });
                      },
                    ),
                    const Gap(30),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        setState(() {
                          _phone = number.phoneNumber!;
                        });
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                        trailingSpace: false,
                      ),
                      ignoreBlank: false,
                      locale: Storage.getString('language') ?? 'en',
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: PhoneNumber(
                        isoCode: _isoCode ?? state.data['address'] ?? "",
                        phoneNumber: state.data['phone'] ?? "",
                      ),
                      hintText: t.phoneNumber,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputBorder: const OutlineInputBorder(),
                    ),
                    const Gap(30),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          setState(() => loading = true);

                          context.read<ProfileBloc>().add(
                                ChangeProfile(
                                  name: _name!,
                                  address: _address.text,
                                  phone: _phone!,
                                ),
                              );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: amber,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: state is ProfileLoading
                            ? const CircularProgressIndicator(
                                color: white,
                              )
                            : Text(
                                t.change,
                                style: const TextStyle(
                                  color: white,
                                  fontFamily: "Arial",
                                ),
                              ),
                      ),
                    ),
                    const Gap(10),
                  ],
                );
              }

              return Center(
                child: CircularProgressIndicator(
                    color: amber),
              );
            },
          ),
        ),
      ),
    );
  }
}
