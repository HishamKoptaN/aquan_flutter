import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLayout extends StatefulWidget {
  AppLayout({
    super.key,
    required this.route,
    required this.body,
    required this.showAppBar,
  });
  final String route;
  final Widget body;
  final bool showAppBar;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
          appBar: widget.showAppBar
              ? AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(
                    t.sendToAnOtherAccount,
                    style: const TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                )
              : null,
          body: widget.body),
    );
  }
}
