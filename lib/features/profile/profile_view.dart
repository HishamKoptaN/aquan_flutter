import 'package:aquan/features/change_password/change_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/singletons/user_singleton.dart';
import '../accounts/presentation/pages/accounts_view.dart';
import '../plans/presentation/view/plans_view/plans_view.dart';
import 'bloc/profile_bloc.dart';
import 'change_profile_view.dart';

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
        create: (context) => ProfileBloc(),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150.sp,
                      width: 150.sp,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(
                            UserSingleton.instance.user!.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                        border: Border.all(
                          color: Colors.amber,
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
                          UserSingleton.instance.user!.name,
                          style: const TextStyle(
                            color: Colors.black,
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
                          UserSingleton.instance.user!.email,
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
                          UserSingleton.instance.user!.phone,
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
                                  color: Colors.black,
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
                              builder: (context) => MyAccountsView(),
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
                              FontAwesomeIcons.buildingColumns,
                              color: Colors.grey,
                            ),
                            const Gap(20),
                            Expanded(
                              child: Text(
                                t.myAccounts,
                                style: const TextStyle(
                                  color: Colors.black,
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
                                      // userName: state.data['username'] ?? "",
                                      // phone: state.data['phone'].toString(),
                                      // address: state.data['address'] ?? "",
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
                                  color: Colors.black,
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
                                  color: Colors.black,
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
          },
        ),
      ),
    );
  }
}
