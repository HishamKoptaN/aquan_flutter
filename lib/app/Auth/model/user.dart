class User {
  String? id;
  String? status;
  String? token;
  String? refcode;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? image;
  String? address;
  String? phone;
  String? phoneVerifiedAt;
  int? balance;
  String? phoneVerificationCode;
  String? inactivateEndAt;
  String? message;
  List<AccountInfo>? accountInfo;
  String? referedBy;
  int? planId;
  String? createdAt;
  String? updatedAt;
  String? balanceFormated;

  User({
    this.id,
    this.status,
    this.token,
    this.refcode,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.image,
    this.address,
    this.phone,
    this.phoneVerifiedAt,
    this.balance,
    this.phoneVerificationCode,
    this.inactivateEndAt,
    this.message,
    this.accountInfo,
    this.referedBy,
    this.planId,
    this.createdAt,
    this.updatedAt,
    this.balanceFormated,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString(); // تحويل id إلى String
    status = json['status'] as String?;
    token = json['token'] as String?;
    refcode = json['refcode'] as String?;
    name = json['name'] as String?;
    username = json['username'] as String?;
    email = json['email'] as String?;
    emailVerifiedAt = json['email_verified_at'] as String?;
    image = json['image'] as String?;
    address = json['address'] as String?;
    phone = json['phone'] as String?;
    phoneVerifiedAt = json['phone_verified_at'] as String?;
    balance = json['balance'] is int
        ? json['balance']
        : int.tryParse(json['balance'].toString());
    phoneVerificationCode = json['phone_verification_code'] as String?;
    inactivateEndAt = json['inactivate_end_at'] as String?;
    message = json['message'] as String?;
    if (json['account_info'] != null && json['account_info'] is List) {
      accountInfo = <AccountInfo>[];
      json['account_info'].forEach((v) {
        accountInfo!.add(AccountInfo.fromJson(v));
      });
    }
    referedBy = json['refered_by'] as String?;
    planId = json['plan_id'] is int
        ? json['plan_id']
        : int.tryParse(json['plan_id'].toString());
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    balanceFormated = json['balance_formated'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['status'] = status;
    data['token'] = token;
    data['refcode'] = refcode;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['image'] = image;
    data['address'] = address;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['balance'] = balance;
    data['phone_verification_code'] = phoneVerificationCode;
    data['inactivate_end_at'] = inactivateEndAt;
    data['message'] = message;
    if (accountInfo != null) {
      data['account_info'] = accountInfo!.map((v) => v.toJson()).toList();
    }
    data['refered_by'] = referedBy;
    data['plan_id'] = planId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['balance_formated'] = balanceFormated;
    return data;
  }
}

class AccountInfo {
  String? currency;
  String? value;

  AccountInfo({
    this.currency,
    this.value,
  });

  AccountInfo.fromJson(Map<String, dynamic> json) {
    currency = json['currency'] as String?;
    value = json['value'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['currency'] = currency;
    data['value'] = value;
    return data;
  }
}
