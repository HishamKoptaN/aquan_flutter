import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc/bottom_navigation_bar_bloc.dart';
import 'bloc/bottom_navigation_bar_event.dart';
import 'bloc/bottom_navigation_bar_state.dart';
import 'navigator_bottom_bar_controller.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});

  @override
  State<NavigateBarScreen> createState() => _NavigateBarScreenState();
}

class _NavigateBarScreenState extends State<NavigateBarScreen> {
  late NavigatorBottomBarCnr cnr;
  int _currentIndex = 0; // Variable to track current tab index

  @override
  void initState() {
    super.initState();
    cnr = NavigatorBottomBarCnr();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocProvider(
        create: (context) => NavigationBloc()..add(ChangePageEvent(0)),
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is NavigationPageChanged) {
              _currentIndex = state.pageIndex; // Update current index
            }
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SizedBox(child: cnr.pages[_currentIndex]),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index; // Update current index on tap
                    });
                    context.read<NavigationBloc>().add(ChangePageEvent(index));
                  },
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.grey,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: t.home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.task),
                      label: t.tasks,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(FontAwesomeIcons.moneyBillTransfer),
                      label: t.buyandsell,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.qr_code_2_rounded),
                      label: t.qr_code,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      label: t.settings,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
