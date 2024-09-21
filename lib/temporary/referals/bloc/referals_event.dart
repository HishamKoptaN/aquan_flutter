part of 'referals_bloc.dart';

abstract class ReferalsEvent {}

class ReferalsPlans extends ReferalsEvent {}

class GetReferals extends ReferalsEvent {}

class EmitState extends ReferalsEvent {}
