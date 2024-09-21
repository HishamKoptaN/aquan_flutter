part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileUser extends ProfileEvent {}

class GetAccountsEvent extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String address;
  final String phone;

  const UpdateProfile({
    required this.name,
    required this.address,
    required this.phone,
  });
}

class ChangeProfileImage extends ProfileEvent {
  final File file;

  const ChangeProfileImage({required this.file});
}

class ChangePassword extends ProfileEvent {
  final String currentPassword;
  final String newPassword;
  final String newPasswordConfirmation;

  const ChangePassword({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });
}
