part of 'plan_bloc.dart';

abstract class PlanState {}

final class PlanInitial extends PlanState {}

final class PlanLoading extends PlanState {}

class PlanError extends PlanState {
  final String? message;

  PlanError({required this.message});
}

class PlansDone extends PlanState {
  final List<Plan> plans;
  final User user;

  PlansDone({
    required this.plans,
    required this.user,
  });
}

class PaymentDone extends PlanState {
  final String? message;

  PaymentDone({required this.message});
}

class PaymentMethodsDone extends PlanState {
  List<Currency> methods;

  PaymentMethodsDone({
    required this.methods,
  });
}
