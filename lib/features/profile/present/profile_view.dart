import 'package:aquan/features/auth/change_password/edit_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/singletons/user_singleton.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../accounts/present/pages/accounts_view.dart';
import '../../plans/present/view/plans_view/plans_view.dart';
import 'bloc/profile_bloc.dart';
import 'bloc/profile_state.dart';
import 'change_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: CustomText(
          text: t.changeProfile,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(
          editProfileUseCase: getIt(),
        ),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              children: [
                _buildProfileHeader(),
                _buildProfileInfoRow(t),
                _buildProfileOption(
                  context,
                  icon: FontAwesomeIcons.arrowUpFromBracket,
                  text: t.upgradeAccount,
                  onTap: () => _navigateTo(
                    context,
                    const PlansView(),
                  ),
                ),
                _buildProfileOption(
                  context,
                  icon: FontAwesomeIcons.buildingColumns,
                  text: t.myAccounts,
                  onTap: () => _navigateTo(
                    context,
                    const AccountsView(),
                  ),
                ),
                _buildProfileOption(
                  context,
                  icon: FontAwesomeIcons.userGear,
                  text: t.changeProfile,
                  onTap: () => _navigateTo(
                    context,
                    const ChangeProfileScreen(),
                  ),
                ),
                _buildProfileOption(
                  context,
                  icon: FontAwesomeIcons.pen,
                  text: t.changePassword,
                  onTap: () => _navigateTo(
                    context,
                    const EditPassView(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          height: 150.sp,
          width: 150.sp,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: NetworkImage(
                UserSingleton.instance.user?.image ?? '',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.amber,
              width: 6.0,
            ),
          ),
        ),
        Gap(
          10.h,
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(
    AppLocalizations t,
  ) {
    return Column(
      children: [
        _buildProfileInfoIconRow(
          icon: FontAwesomeIcons.user,
          text: UserSingleton.instance.user?.firstName ?? '',
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
        _buildProfileInfoIconRow(
          icon: FontAwesomeIcons.envelope,
          text: UserSingleton.instance.user?.email ?? '',
          color: Colors.grey,
          fontSize: 20.sp,
        ),
        _buildProfileInfoIconRow(
          icon: FontAwesomeIcons.phone,
          text: UserSingleton.instance.user?.phone ?? '',
          color: Colors.green,
          fontSize: 20.sp,
        ),
      ],
    );
  }

  Widget _buildProfileInfoIconRow({
    required IconData icon,
    required String text,
    Color color = Colors.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Gap(
          10.w,
        ),
        CustomText(
          text: text,
          color: color,
          fontSize: fontSize ?? 20.sp,
          fontWeight: fontWeight,
        ),
      ],
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            Gap(
              20.w,
            ),
            Expanded(
              child: CustomText(
                text: text,
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            Icon(
              FontAwesomeIcons.caretLeft,
              color: Colors.grey,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}
