import 'package:aquan/features/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/di/dependency_injection.dart';
import '../dash/present/bloc/dash_bloc.dart';
import '../plans/present/bloc/plans_bloc.dart';
import '../trans/present/bloc/trans_bloc.dart';
import 'bloc/bottom_navigation_bar_bloc.dart';
import 'bloc/bottom_navigation_bar_event.dart';
import 'bloc/bottom_navigation_bar_state.dart';
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
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    cnr = NavigatorBottomBarCnr();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return MultiBlocProvider(
      key: const Key('NavigateBarView'),
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<DashBloc>(
            create: (context) => DashBloc(
                  getDashUseCase: getIt(),
                )),
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
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) async {},
      builder: (context, state) {
        if (state is NavigationPageChanged) {
          _currentIndex = state.pageIndex;
        }
        return Scaffold(
          body: SizedBox(
            child: cnr.pages[_currentIndex],
          ),
          bottomNavigationBar: _buildBottomNavigationBar(
            context,
            t,
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, AppLocalizations t) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
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
            setState(() {
              _currentIndex = index;
            });
            context.read<NavigationBloc>().add(ChangePageEvent(index));
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
