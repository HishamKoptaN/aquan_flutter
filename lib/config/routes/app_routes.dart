import 'package:flutter/material.dart';

import '../../features/dash/presentation/view/dash_view.dart';
import 'routes.dart';

class AppRoutes {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const DashView(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const DashView(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const DashView(),
        );
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashView(),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const DashView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(settings.name!),
            ),
            body: const Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
