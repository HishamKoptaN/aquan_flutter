import '../model/dashboard_model.dart';

abstract class DashboardState {}

final class HomeInitial extends DashboardState {}

class GettingServices extends DashboardState {}

class DoneServices extends DashboardState {
  final List<dynamic> services;

  DoneServices({required this.services});
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError({required this.message});
}

class DashboardLoaded extends DashboardState {
  final GetDashboardApiResModel getDashboardApiResModel;
  final Map<String, dynamic> localData;
  DashboardLoaded({
    required this.getDashboardApiResModel,
    required this.localData,
  });
}
