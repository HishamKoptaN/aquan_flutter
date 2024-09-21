part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileDone extends ProfileState {
  final Map<String, dynamic> data;
  const ProfileDone({required this.data});
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});
}

final class ProfileLoading extends ProfileState {}

final class ProfileUpdatedSuccessfully extends ProfileState {}

final class ProfileUpdatedFailure extends ProfileState {
  final String message;

  const ProfileUpdatedFailure({required this.message});
}
