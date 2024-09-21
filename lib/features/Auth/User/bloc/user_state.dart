// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}

class SearchAboutUserAccountById extends UserState {
  final String name;

  SearchAboutUserAccountById({required this.name});
}
