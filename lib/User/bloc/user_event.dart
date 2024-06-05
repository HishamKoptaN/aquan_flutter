part of 'user_bloc.dart';

abstract class UserEvent {}

class GetReferals extends UserEvent {}

class GetProfileUser extends UserEvent {}

class ChangeProfile extends UserEvent {
  final String name;
  final String address;
  final String phone;

  ChangeProfile({
    required this.name,
    required this.address,
    required this.phone,
  });
}

class ChangeProfileImage extends UserEvent {
  final File file;

  ChangeProfileImage({required this.file});
}

class ChangePassword extends UserEvent {
  final String currentPassword;
  final String newPassword;
  final String newPasswordConfirmation;

  ChangePassword({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });
}

class Dashboard extends UserEvent {}

class GetNameOfUserByAccount extends UserEvent {
  final String accountId;

  GetNameOfUserByAccount({required this.accountId});
}

class SendPaymentToOtherAccount extends UserEvent {
  final String accountId;
  final String amount;

  SendPaymentToOtherAccount({required this.accountId, required this.amount});
}

class GetNotifications extends UserEvent {}

class ChangeAccountInfo extends UserEvent {
  final List<AccountInfo> accountInfo;

  ChangeAccountInfo({required this.accountInfo});
}
