part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileDone extends ProfileState {
  final bool updated;
  final Map<String, dynamic> data;

  ProfileDone({required this.data, this.updated = false});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

final class ProfileLoading extends ProfileState {}

final class ProfileUpdatedSuccess extends ProfileState {
  final String message;

  ProfileUpdatedSuccess({required this.message});
}

final class ProfileUpdatedFailure extends ProfileState {
  final String message;

  ProfileUpdatedFailure({required this.message});
}
