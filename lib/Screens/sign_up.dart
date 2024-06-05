import 'package:aquan/Auth/bloc/auth_bloc.dart';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/Screens/login.dart';
import 'package:aquan/Screens/plans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  List countries = [
    {"name": 'Afghanistan', "code": 'AF'},
    {"name": 'Åland Islands', "code": 'AX'},
    {"name": 'Albania', "code": 'AL'},
    {"name": 'Algeria', "code": 'DZ'},
    {"name": 'American Samoa', "code": 'AS'},
    {"name": 'AndorrA', "code": 'AD'},
    {"name": 'Angola', "code": 'AO'},
    {"name": 'Anguilla', "code": 'AI'},
    {"name": 'Antarctica', "code": 'AQ'},
    {"name": 'Antigua and Barbuda', "code": 'AG'},
    {"name": 'Argentina', "code": 'AR'},
    {"name": 'Armenia', "code": 'AM'},
    {"name": 'Aruba', "code": 'AW'},
    {"name": 'Australia', "code": 'AU'},
    {"name": 'Austria', "code": 'AT'},
    {"name": 'Azerbaijan', "code": 'AZ'},
    {"name": 'Bahamas', "code": 'BS'},
    {"name": 'Bahrain', "code": 'BH'},
    {"name": 'Bangladesh', "code": 'BD'},
    {"name": 'Barbados', "code": 'BB'},
    {"name": 'Belarus', "code": 'BY'},
    {"name": 'Belgium', "code": 'BE'},
    {"name": 'Belize', "code": 'BZ'},
    {"name": 'Benin', "code": 'BJ'},
    {"name": 'Bermuda', "code": 'BM'},
    {"name": 'Bhutan', "code": 'BT'},
    {"name": 'Bolivia', "code": 'BO'},
    {"name": 'Bosnia and Herzegovina', "code": 'BA'},
    {"name": 'Botswana', "code": 'BW'},
    {"name": 'Bouvet Island', "code": 'BV'},
    {"name": 'Brazil', "code": 'BR'},
    {"name": 'British Indian Ocean Territory', "code": 'IO'},
    {"name": 'Brunei Darussalam', "code": 'BN'},
    {"name": 'Bulgaria', "code": 'BG'},
    {"name": 'Burkina Faso', "code": 'BF'},
    {"name": 'Burundi', "code": 'BI'},
    {"name": 'Cambodia', "code": 'KH'},
    {"name": 'Cameroon', "code": 'CM'},
    {"name": 'Canada', "code": 'CA'},
    {"name": 'Cape Verde', "code": 'CV'},
    {"name": 'Cayman Islands', "code": 'KY'},
    {"name": 'Central African Republic', "code": 'CF'},
    {"name": 'Chad', "code": 'TD'},
    {"name": 'Chile', "code": 'CL'},
    {"name": 'China', "code": 'CN'},
    {"name": 'Christmas Island', "code": 'CX'},
    {"name": 'Cocos (Keeling) Islands', "code": 'CC'},
    {"name": 'Colombia', "code": 'CO'},
    {"name": 'Comoros', "code": 'KM'},
    {"name": 'Congo', "code": 'CG'},
    {"name": 'Congo, The Democratic Republic of the', "code": 'CD'},
    {"name": 'Cook Islands', "code": 'CK'},
    {"name": 'Costa Rica', "code": 'CR'},
    {"name": 'Cote D\'Ivoire', "code": 'CI'},
    {"name": 'Croatia', "code": 'HR'},
    {"name": 'Cuba', "code": 'CU'},
    {"name": 'Cyprus', "code": 'CY'},
    {"name": 'Czech Republic', "code": 'CZ'},
    {"name": 'Denmark', "code": 'DK'},
    {"name": 'Djibouti', "code": 'DJ'},
    {"name": 'Dominica', "code": 'DM'},
    {"name": 'Dominican Republic', "code": 'DO'},
    {"name": 'Ecuador', "code": 'EC'},
    {"name": 'Egypt', "code": 'EG'},
    {"name": 'El Salvador', "code": 'SV'},
    {"name": 'Equatorial Guinea', "code": 'GQ'},
    {"name": 'Eritrea', "code": 'ER'},
    {"name": 'Estonia', "code": 'EE'},
    {"name": 'Ethiopia', "code": 'ET'},
    {"name": 'Falkland Islands (Malvinas)', "code": 'FK'},
    {"name": 'Faroe Islands', "code": 'FO'},
    {"name": 'Fiji', "code": 'FJ'},
    {"name": 'Finland', "code": 'FI'},
    {"name": 'France', "code": 'FR'},
    {"name": 'French Guiana', "code": 'GF'},
    {"name": 'French Polynesia', "code": 'PF'},
    {"name": 'French Southern Territories', "code": 'TF'},
    {"name": 'Gabon', "code": 'GA'},
    {"name": 'Gambia', "code": 'GM'},
    {"name": 'Georgia', "code": 'GE'},
    {"name": 'Germany', "code": 'DE'},
    {"name": 'Ghana', "code": 'GH'},
    {"name": 'Gibraltar', "code": 'GI'},
    {"name": 'Greece', "code": 'GR'},
    {"name": 'Greenland', "code": 'GL'},
    {"name": 'Grenada', "code": 'GD'},
    {"name": 'Guadeloupe', "code": 'GP'},
    {"name": 'Guam', "code": 'GU'},
    {"name": 'Guatemala', "code": 'GT'},
    {"name": 'Guernsey', "code": 'GG'},
    {"name": 'Guinea', "code": 'GN'},
    {"name": 'Guinea-Bissau', "code": 'GW'},
    {"name": 'Guyana', "code": 'GY'},
    {"name": 'Haiti', "code": 'HT'},
    {"name": 'Heard Island and Mcdonald Islands', "code": 'HM'},
    {"name": 'Holy See (Vatican City State)', "code": 'VA'},
    {"name": 'Honduras', "code": 'HN'},
    {"name": 'Hong Kong', "code": 'HK'},
    {"name": 'Hungary', "code": 'HU'},
    {"name": 'Iceland', "code": 'IS'},
    {"name": 'India', "code": 'IN'},
    {"name": 'Indonesia', "code": 'ID'},
    {"name": 'Iran, Islamic Republic Of', "code": 'IR'},
    {"name": 'Iraq', "code": 'IQ'},
    {"name": 'Ireland', "code": 'IE'},
    {"name": 'Isle of Man', "code": 'IM'},
    {"name": 'Israel', "code": 'IL'},
    {"name": 'Italy', "code": 'IT'},
    {"name": 'Jamaica', "code": 'JM'},
    {"name": 'Japan', "code": 'JP'},
    {"name": 'Jersey', "code": 'JE'},
    {"name": 'Jordan', "code": 'JO'},
    {"name": 'Kazakhstan', "code": 'KZ'},
    {"name": 'Kenya', "code": 'KE'},
    {"name": 'Kiribati', "code": 'KI'},
    {"name": 'Korea, Democratic People\'S Republic of', "code": 'KP'},
    {"name": 'Korea, Republic of', "code": 'KR'},
    {"name": 'Kuwait', "code": 'KW'},
    {"name": 'Kyrgyzstan', "code": 'KG'},
    {"name": 'Lao People\'S Democratic Republic', "code": 'LA'},
    {"name": 'Latvia', "code": 'LV'},
    {"name": 'Lebanon', "code": 'LB'},
    {"name": 'Lesotho', "code": 'LS'},
    {"name": 'Liberia', "code": 'LR'},
    {"name": 'Libyan Arab Jamahiriya', "code": 'LY'},
    {"name": 'Liechtenstein', "code": 'LI'},
    {"name": 'Lithuania', "code": 'LT'},
    {"name": 'Luxembourg', "code": 'LU'},
    {"name": 'Macao', "code": 'MO'},
    {"name": 'Macedonia, The Former Yugoslav Republic of', "code": 'MK'},
    {"name": 'Madagascar', "code": 'MG'},
    {"name": 'Malawi', "code": 'MW'},
    {"name": 'Malaysia', "code": 'MY'},
    {"name": 'Maldives', "code": 'MV'},
    {"name": 'Mali', "code": 'ML'},
    {"name": 'Malta', "code": 'MT'},
    {"name": 'Marshall Islands', "code": 'MH'},
    {"name": 'Martinique', "code": 'MQ'},
    {"name": 'Mauritania', "code": 'MR'},
    {"name": 'Mauritius', "code": 'MU'},
    {"name": 'Mayotte', "code": 'YT'},
    {"name": 'Mexico', "code": 'MX'},
    {"name": 'Micronesia, Federated States of', "code": 'FM'},
    {"name": 'Moldova, Republic of', "code": 'MD'},
    {"name": 'Monaco', "code": 'MC'},
    {"name": 'Mongolia', "code": 'MN'},
    {"name": 'Montserrat', "code": 'MS'},
    {"name": 'Morocco', "code": 'MA'},
    {"name": 'Mozambique', "code": 'MZ'},
    {"name": 'Myanmar', "code": 'MM'},
    {"name": 'Namibia', "code": 'NA'},
    {"name": 'Nauru', "code": 'NR'},
    {"name": 'Nepal', "code": 'NP'},
    {"name": 'Netherlands', "code": 'NL'},
    {"name": 'Netherlands Antilles', "code": 'AN'},
    {"name": 'New Caledonia', "code": 'NC'},
    {"name": 'New Zealand', "code": 'NZ'},
    {"name": 'Nicaragua', "code": 'NI'},
    {"name": 'Niger', "code": 'NE'},
    {"name": 'Nigeria', "code": 'NG'},
    {"name": 'Niue', "code": 'NU'},
    {"name": 'Norfolk Island', "code": 'NF'},
    {"name": 'Northern Mariana Islands', "code": 'MP'},
    {"name": 'Norway', "code": 'NO'},
    {"name": 'Oman', "code": 'OM'},
    {"name": 'Pakistan', "code": 'PK'},
    {"name": 'Palau', "code": 'PW'},
    {"name": 'Palestinian Territory, Occupied', "code": 'PS'},
    {"name": 'Panama', "code": 'PA'},
    {"name": 'Papua New Guinea', "code": 'PG'},
    {"name": 'Paraguay', "code": 'PY'},
    {"name": 'Peru', "code": 'PE'},
    {"name": 'Philippines', "code": 'PH'},
    {"name": 'Pitcairn', "code": 'PN'},
    {"name": 'Poland', "code": 'PL'},
    {"name": 'Portugal', "code": 'PT'},
    {"name": 'Puerto Rico', "code": 'PR'},
    {"name": 'Qatar', "code": 'QA'},
    {"name": 'Reunion', "code": 'RE'},
    {"name": 'Romania', "code": 'RO'},
    {"name": 'Russian Federation', "code": 'RU'},
    {"name": 'RWANDA', "code": 'RW'},
    {"name": 'Saint Helena', "code": 'SH'},
    {"name": 'Saint Kitts and Nevis', "code": 'KN'},
    {"name": 'Saint Lucia', "code": 'LC'},
    {"name": 'Saint Pierre and Miquelon', "code": 'PM'},
    {"name": 'Saint Vincent and the Grenadines', "code": 'VC'},
    {"name": 'Samoa', "code": 'WS'},
    {"name": 'San Marino', "code": 'SM'},
    {"name": 'Sao Tome and Principe', "code": 'ST'},
    {"name": 'Saudi Arabia', "code": 'SA'},
    {"name": 'Senegal', "code": 'SN'},
    {"name": 'Serbia and Montenegro', "code": 'CS'},
    {"name": 'Seychelles', "code": 'SC'},
    {"name": 'Sierra Leone', "code": 'SL'},
    {"name": 'Singapore', "code": 'SG'},
    {"name": 'Slovakia', "code": 'SK'},
    {"name": 'Slovenia', "code": 'SI'},
    {"name": 'Solomon Islands', "code": 'SB'},
    {"name": 'Somalia', "code": 'SO'},
    {"name": 'South Africa', "code": 'ZA'},
    {"name": 'South Georgia and the South Sandwich Islands', "code": 'GS'},
    {"name": 'Spain', "code": 'ES'},
    {"name": 'Sri Lanka', "code": 'LK'},
    {"name": 'Sudan', "code": 'SD'},
    {"name": 'Suriname', "code": 'SR'},
    {"name": 'Svalbard and Jan Mayen', "code": 'SJ'},
    {"name": 'Swaziland', "code": 'SZ'},
    {"name": 'Sweden', "code": 'SE'},
    {"name": 'Switzerland', "code": 'CH'},
    {"name": 'Syrian Arab Republic', "code": 'SY'},
    {"name": 'Taiwan, Province of China', "code": 'TW'},
    {"name": 'Tajikistan', "code": 'TJ'},
    {"name": 'Tanzania, United Republic of', "code": 'TZ'},
    {"name": 'Thailand', "code": 'TH'},
    {"name": 'Timor-Leste', "code": 'TL'},
    {"name": 'Togo', "code": 'TG'},
    {"name": 'Tokelau', "code": 'TK'},
    {"name": 'Tonga', "code": 'TO'},
    {"name": 'Trinidad and Tobago', "code": 'TT'},
    {"name": 'Tunisia', "code": 'TN'},
    {"name": 'Turkey', "code": 'TR'},
    {"name": 'Turkmenistan', "code": 'TM'},
    {"name": 'Turks and Caicos Islands', "code": 'TC'},
    {"name": 'Tuvalu', "code": 'TV'},
    {"name": 'Uganda', "code": 'UG'},
    {"name": 'Ukraine', "code": 'UA'},
    {"name": 'United Arab Emirates', "code": 'AE'},
    {"name": 'United Kingdom', "code": 'GB'},
    {"name": 'United States', "code": 'US'},
    {"name": 'United States Minor Outlying Islands', "code": 'UM'},
    {"name": 'Uruguay', "code": 'UY'},
    {"name": 'Uzbekistan', "code": 'UZ'},
    {"name": 'Vanuatu', "code": 'VU'},
    {"name": 'Venezuela', "code": 'VE'},
    {"name": 'Viet Nam', "code": 'VN'},
    {"name": 'Virgin Islands, British', "code": 'VG'},
    {"name": 'Virgin Islands, U.S.', "code": 'VI'},
    {"name": 'Wallis and Futuna', "code": 'WF'},
    {"name": 'Western Sahara', "code": 'EH'},
    {"name": 'Yemen', "code": 'YE'},
    {"name": 'Zambia', "code": 'ZM'},
    {"name": 'Zimbabwe', "code": 'ZW'}
  ];

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
                  builder: (context) => const PlansScreen(),
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
                      child: Text(t.oo),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
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
