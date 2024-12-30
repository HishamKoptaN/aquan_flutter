class EditPassReqBodyModel {
  static final EditPassReqBodyModel _instance = EditPassReqBodyModel._();
  factory EditPassReqBodyModel() {
    return _instance;
  }
  EditPassReqBodyModel._();
  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirmation;

  Map<String, dynamic> toJson() => {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      };
}
