part of 'plan_bloc.dart';

abstract class PlanEvent {}

class GetPlans extends PlanEvent {}

class PayPlan extends PlanEvent {
  final File image;
  final Plan plan;

  PayPlan({required this.image, required this.plan});
}

class GetPaymentMethods extends PlanEvent {}
