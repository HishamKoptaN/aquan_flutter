import '../../features/dashboard/view/dashboard_view.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
}

final routes = {
  AppRoutes.dashboard: (context) => DashboardView(),
};
