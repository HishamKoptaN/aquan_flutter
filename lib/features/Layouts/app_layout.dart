import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLayout extends StatefulWidget {
  AppLayout({
    super.key,
    this.route,
    required this.body,
    required this.showAppBar,
    this.backArow = true,
    this.onPressed,
  });
  final String? route;
  final Widget body;
  final bool showAppBar;
  final bool backArow;
  void Function()? onPressed;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.showAppBar
            ? AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: widget.backArow
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: widget.onPressed ??
                            () {
                              Navigator.pop(context);
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const NavigateBarView(),
                              //   ),
                              // );
                            },
                      )
                    : null,
                title: Text(
                  widget.route ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
              )
            : null,
        body: Padding(
          padding: EdgeInsets.all(
            5.sp,
          ),
          child: widget.body,
        ),
      ),
    );
  }
}
