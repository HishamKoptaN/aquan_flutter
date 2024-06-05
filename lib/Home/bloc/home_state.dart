part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

class GettingServices extends HomeState {}

class DoneServices extends HomeState {
  final List<dynamic> services;

  DoneServices({required this.services});
}
