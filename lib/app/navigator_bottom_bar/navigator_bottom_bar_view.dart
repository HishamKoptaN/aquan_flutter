// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../Auth/verify_code/verify_email_view.dart';
import 'bloc/navigator_bar_bloc.dart';
import 'navigator_bottom_bar_cnr.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});
  @override
  State<NavigateBarScreen> createState() => _HomePageState();
}

class _HomePageState extends State<NavigateBarScreen> {
  @override
  Widget build(BuildContext context) {
    NavigatorBottomBarCnr cnr = NavigatorBottomBarCnr();
    return BlocProvider<NavigatorBarBloc>(
      create: (context) => NavigatorBarBloc()..add(CheckEmailVerification()),
      child: BlocBuilder<NavigatorBarBloc, NavigatorBarState>(
        builder: (context, state) {
          if (state is VerifiedEmail) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SizedBox(
                  child: cnr.pages[cnr.currentIndex],
                ),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  margin: const EdgeInsets.all(5),
                  child: SalomonBottomBar(
                    curve: Curves.slowMiddle,
                    currentIndex: cnr.currentIndex,
                    backgroundColor: Colors.white60,
                    onTap: (int index) async {
                      cnr.setCurrentIndex(index);
                    },
                    items: [
                      SalomonBottomBarItem(
                        selectedColor: Colors.green,
                        unselectedColor: Colors.grey,
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.black],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.favorite,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          "المفضله",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      SalomonBottomBarItem(
                        selectedColor: Colors.green,
                        unselectedColor: Colors.grey,
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.black],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.shopping_cart_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "سلة الطلبات",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                      SalomonBottomBarItem(
                        selectedColor: Colors.green,
                        unselectedColor: Colors.grey,
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.black],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.category_rounded,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          "الفئات",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      SalomonBottomBarItem(
                        selectedColor: Colors.green,
                        unselectedColor: Colors.grey,
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black,
                                Colors.black,
                              ],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.home,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          "الرئيسيه",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is NotVerifiedEmail) {
            return VerifyEmailView();
          }
          return SizedBox();
        },
      ),
    );
  }
}
