import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/change_password/change_password_view.dart';
import 'package:aquan/app/profile/change_profile_view.dart';
import 'package:aquan/app/Plans/view/plans_view.dart';
import 'package:aquan/app/wallet/view/wallet_view.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showWallet = false;

  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc()
          ..add(
            GetProfileUser(),
          ),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is ProfileDone) {
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(FontAwesomeIcons.user),
                          const Gap(10),
                          Text(
                            state.user.name!,
                            style: const TextStyle(
                              color: black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.envelope,
                            color: Colors.grey,
                          ),
                          const Gap(10),
                          Text(
                            state.user.email!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      if (state.user.phone != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.phone,
                              color: Colors.green,
                              size: 16,
                            ),
                            const Gap(10),
                            Text(
                              state.user.phone!,
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      const Gap(30),
                      InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const PlansScreen(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey),
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.arrowUpFromBracket,
                                color: Colors.grey,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  t.upgradeAccount,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Icon(
                                FontAwesomeIcons.caretLeft,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MyWalletScreen(),
                                  ),
                                )
                                .then(
                                  (value) => context
                                      .read<UserBloc>()
                                      .add(GetProfileUser()),
                                ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.buildingColumns,
                                color: Colors.grey,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  t.myAccounts,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Icon(
                                FontAwesomeIcons.caretLeft,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeProfileScreen(user: state.user),
                                  ),
                                )
                                .then(
                                  (value) => context
                                      .read<UserBloc>()
                                      .add(GetProfileUser()),
                                ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.userGear,
                                color: Colors.grey,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  t.changeProfile,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Icon(
                                FontAwesomeIcons.caretLeft,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ChangePasswordScreen(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.grey,
                              ),
                              const Gap(20),
                              Expanded(
                                child: Text(
                                  t.changePassword,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Icon(
                                FontAwesomeIcons.caretLeft,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  )
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
    );
  }
}
