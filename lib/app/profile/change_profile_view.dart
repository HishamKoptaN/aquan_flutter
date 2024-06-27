import 'dart:io';

import 'package:aquan/Helpers/Storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:motion_toast/resources/colors.dart';

import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  String? _name;
  String? _phone;

  final TextEditingController _address = TextEditingController();

  String? _isoCode;
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

  bool loading = false;

  @override
  void initState() {
    _name = widget.user.name ?? "";
    _address.text = widget.user.address ?? "";
    _phone = widget.user.phone ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.changeProfile,
      body: Container(
        padding: const EdgeInsets.all(10),
        width: size.width,
        child: BlocProvider<UserBloc>(
          create: (context) => UserBloc()..add(GetProfileUser()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              String? error;
              if (state is UserError) {
                error = state.message;
              }
              if (state is ProfileDone) {
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
                                    .read<UserBloc>()
                                    .add(ChangeProfileImage(file: file)),
                              );
                            }
                          },
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              image: DecorationImage(
                                image: NetworkImage(state.user.image!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100.0),
                              ),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
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
                        //   controller: _name,
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
                      value: state.user.address ?? "EG",
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
                        isoCode: _isoCode ?? state.user.address,
                        phoneNumber: state.user.phone,
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
                    const Gap(30),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          setState(() => loading = true);

                          context.read<UserBloc>().add(
                                ChangeProfile(
                                  name: _name!,
                                  address: _address.text,
                                  phone: _phone!,
                                ),
                              );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: state is UserLoading
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
                    color: Theme.of(context).primaryColor),
              );
            },
          ),
        ),
      ),
    );
  }
}
