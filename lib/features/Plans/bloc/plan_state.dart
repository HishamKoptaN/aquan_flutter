part of 'plan_bloc.dart';

abstract class PlanState {}

class CheckboxState {
  final bool isChecked;

  CheckboxState({required this.isChecked});

  factory CheckboxState.initial() {
    return CheckboxState(isChecked: false);
  }

  CheckboxState copyWith({bool? isChecked}) {
    return CheckboxState(
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

final class PlanInitial extends PlanState {}

final class PlanLoading extends PlanState {}

class PlanError extends PlanState {
  final String? message;

  PlanError({required this.message});
}

class PlansDone extends PlanState {
  List<Plan>? plans;
  int userPlanId;
  String startDate;
  String endDate;
  PlansDone({
    this.plans,
    required this.userPlanId,
    required this.startDate,
    required this.endDate,
  });
}

class PlanPayedSuccessfully extends PlanState {}

class PlansRatesDone extends PlanState {
  GetPlansRatesApiResModel getPlansRatesApiResModel;

  PlansRatesDone({
    required this.getPlansRatesApiResModel,
  });
}