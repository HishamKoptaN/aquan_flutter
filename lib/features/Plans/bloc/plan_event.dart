part of 'plan_bloc.dart';

abstract class PlanEvent {}

class GetPlans extends PlanEvent {}

class PayPlan extends PlanEvent {
  final int planId;
  final File image;
  final int method;

  PayPlan({
    required this.planId,
    required this.image,
    required this.method,
  });
}

class ToggleCheckbox extends PlanEvent {
  final bool newValue;
  ToggleCheckbox(this.newValue);
}

class GetPaymentMethods extends PlanEvent {}

class GetUSerPlanDetails extends PlanEvent {}

class EmitState extends PlanEvent {}
