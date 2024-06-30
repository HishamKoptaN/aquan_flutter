import 'package:flutter/material.dart';

@immutable
abstract class SubscritionDetailsEvent {}

class GetSubscribtionDetailsEvent extends SubscritionDetailsEvent {
  int userId;
  GetSubscribtionDetailsEvent({required this.userId});
}
