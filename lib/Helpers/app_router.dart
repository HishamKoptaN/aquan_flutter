import 'package:flutter/material.dart';

import '../app/Layouts/app_layout.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => AppLayout(
            body: Container(),
            route: '',
          ),
        );
      case 'settings':
      // return MaterialPageRoute(builder: (context) => AppLayout());
    }
  }
}
