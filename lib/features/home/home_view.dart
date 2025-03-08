import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aquan/features/layouts/app_layout.dart';
import '../../core/di/dependency_injection.dart';
import '../buy_sell/present/view/buy_sell_view.dart';
import '../dash/present/bloc/dash_bloc.dart';
import '../dash/present/view/dash_view.dart';
import '../plans/present/bloc/plans_bloc.dart';
import '../qr_code/view/qr_code_view.dart';
import '../send_to_account/present/view/send_to_account_view.dart';
import '../trans/present/bloc/trans_bloc.dart';
import '../views/settings_view.dart';
import 'bottom_navigation_bar_controller.dart';

class NavigateBarView extends StatefulWidget {
  const NavigateBarView({
    super.key,
  });
  @override
  State<NavigateBarView> createState() => _NavigateBarViewState();
}

class _NavigateBarViewState extends State<NavigateBarView> {
  late NavigatorBottomBarCnr cnr;
  final List<Widget> _pages = [
    const DashView(),
    const SendToAccountView(),
    const BuySellview(),
    const QrCodeView(),
    const SettingsView(),
  ];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      key: const Key('navigate_bar_view'),
      providers: [
        BlocProvider<DashBloc>(
          create: (context) => DashBloc(
            getDashUseCase: getIt(),
          ),
        ),
        BlocProvider<TransBloc>(
          create: (context) => TransBloc(
            getIt(),
          ),
        ),
        BlocProvider<PlansBloc>(
          create: (context) => PlansBloc(
            getIt(),
            getIt(),
            getIt(),
          ),
        ),
      ],
      child: AppLayout(
        route: '',
        showAppBar: false,
        body: _buildContent(context, t),
      ),
    );
  }

  Widget _buildContent(context, t) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(
        context,
        t,
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, AppLocalizations t) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          // borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 15.sp,
          unselectedFontSize: 12.sp,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: t.home,
            ),
            BottomNavigationBarItem(
              label: t.send,
              icon: const Icon(
                Icons.add_to_home_screen_outlined,
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                FontAwesomeIcons.moneyBillTransfer,
              ),
              label: t.buyandsell,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.qr_code_2_rounded,
              ),
              label: t.qr_code,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              label: t.settings,
            ),
          ],
        ),
      ),
    );
  }
}
