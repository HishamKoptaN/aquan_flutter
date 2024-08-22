import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/change_password/change_password_view.dart';
import 'package:aquan/app/Plans/view/plans_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../accounts/view/accounts_view.dart';
import 'bloc/profile_bloc.dart';
import 'change_profile_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool showWallet = false;

  @override
  void initState() {
    super.initState();
  }

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
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc()..add(GetProfileUser()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
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
                          color: amber,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                          border: Border.all(
                            color: amber,
                            width: 6.0,
                          ),
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl:
                              "https://api.aquan.website/api/images/users/${state.data['image']}",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(FontAwesomeIcons.user),
                          const Gap(10),
                          Text(
                            state.data['name'] ?? "",
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
                            state.data['email'] ?? "",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
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
                            state.data['phone'].toString(),
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
                                builder: (context) => const PlansView(),
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
                          WidgetsBinding.instance.addPostFrameCallback((_) =>
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MyAccountsView(),
                                ),
                              ));
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
                                    builder: (context) => ChangeProfileScreen(
                                      userName: state.data['username'] ?? "",
                                      phone: state.data['phone'].toString(),
                                    ),
                                  ),
                                )
                                .then(
                                  (value) => context
                                      .read<ProfileBloc>()
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
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }
}
