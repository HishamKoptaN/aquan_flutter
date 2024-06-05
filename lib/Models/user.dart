class User {
  int? id;
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
    id,
    status,
    token,
    refcode,
    name,
    username,
    email,
    emailVerifiedAt,
    image,
    address,
    phone,
    phoneVerifiedAt,
    balance,
    phoneVerificationCode,
    inactivateEndAt,
    message,
    accountInfo,
    referedBy,
    planId,
    createdAt,
    updatedAt,
    balanceFormated,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    token = json['token'];
    refcode = json['refcode'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    address = json['address'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    balance = json['balance'];
    phoneVerificationCode = json['phone_verification_code'];
    inactivateEndAt = json['inactivate_end_at'];
    message = json['message'];

    if (json['account_info'].runtimeType != String &&
        json['account_info'] != null) {
      accountInfo = <AccountInfo>[];
      json['account_info'].forEach((v) {
        accountInfo!.add(AccountInfo.fromJson(v));
      });
    }
    referedBy = json['refered_by'];
    planId = json['plan_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    balanceFormated = json['balance_formated'];
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

  AccountInfo({currency, value});

  AccountInfo.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['currency'] = currency;
    data['value'] = value;
    return data;
  }
}
