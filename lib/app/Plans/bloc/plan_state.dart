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
  final List<Plan>? plans;
  final User? user;
  Map<String, String>? planDetails;

  bool? showPLanDetails;
  PlansDone({
    this.plans,
    this.user,
    this.showPLanDetails = false,
    this.planDetails,
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
