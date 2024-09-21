part of 'referals_bloc.dart';

abstract class ReferalsState {}

final class ReferalsInitial extends ReferalsState {}

final class ReferalsLoading extends ReferalsState {}

class ReferalsError extends ReferalsState {
  final String? message;

  ReferalsError({required this.message});
}

class ReferalsLoadedSuccessfully extends ReferalsState {
  GetReferalsApiResModel getReferalsApiResModel;

  ReferalsLoadedSuccessfully({required this.getReferalsApiResModel});
}
