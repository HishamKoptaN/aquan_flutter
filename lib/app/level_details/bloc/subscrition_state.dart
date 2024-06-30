import '../model/subscribtion_model.dart';

abstract class SubscritionDetailsState {}

class SubscritionDetailsInitial extends SubscritionDetailsState {}

class SubscritionDetailsLoading extends SubscritionDetailsState {}

class SubscritionDetailsError extends SubscritionDetailsState {
  final String message;

  SubscritionDetailsError({required this.message});
}

class SubscritionDetailsLoaded extends SubscritionDetailsState {
  final SubscribtionModel subscribtionDetails;

  SubscritionDetailsLoaded({required this.subscribtionDetails});
}
