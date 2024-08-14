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
  final List<TransactionDashboard> transactions;
  final List<CurrencyDashboard> currencies;
  final Map<String, dynamic> localData;
  DashboardLoaded({
    required this.transactions,
    required this.currencies,
    required this.localData,
  });
}
