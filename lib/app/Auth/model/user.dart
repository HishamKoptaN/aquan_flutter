// class User {
//   int id;
//   String status;
//   String token;
//   String name;
//   String username;
//   String email;
//   String image;
//   String address;
//   String phone;
//   int balance;
//   dynamic message;
//   List<AccountInfo> accountInfo;
//   int planId;
//   int role;
//   dynamic referedBy;
//   dynamic confirmationCode;
//   String phoneVerifiedAt;
//   String refcode;
//   String phoneVerificationCode;
//   String upgradedAt;
//   dynamic emailVerifiedAt;
//   dynamic inactivateEndAt;
//   String createdAt;
//   String updatedAt;
//   String balanceFormatted;
//   DateTime createdDate;
//   String upgradedDate;

//   User({
//     required this.id,
//     required this.status,
//     required this.token,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.image,
//     required this.address,
//     required this.phone,
//     required this.balance,
//     required this.message,
//     required this.accountInfo,
//     required this.planId,
//     required this.role,
//     required this.referedBy,
//     required this.confirmationCode,
//     required this.phoneVerifiedAt,
//     required this.refcode,
//     required this.phoneVerificationCode,
//     required this.upgradedAt,
//     required this.emailVerifiedAt,
//     required this.inactivateEndAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.balanceFormatted,
//     required this.createdDate,
//     required this.upgradedDate,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"] ?? 0,
//         status: json["status"] ?? '',
//         token: json["token"] ?? '',
//         name: json["name"] ?? '',
//         username: json["username"] ?? '',
//         email: json["email"] ?? '',
//         image: json["image"] ?? '',
//         address: json["address"] ?? '',
//         phone: json["phone"] ?? '',
//         balance: json["balance"] ?? 0,
//         message: json["message"],
//         accountInfo: json["account_info"] != null
//             ? List<AccountInfo>.from(
//                 json["account_info"].map((x) => AccountInfo.fromJson(x)))
//             : [],
//         planId: json["plan_id"] ?? 0,
//         role: json["role"] ?? 0,
//         referedBy: json["refered_by"],
//         confirmationCode: json["confirmation_code"],
//         phoneVerifiedAt: json["phone_verified_at"] ?? '',
//         refcode: json["refcode"] ?? '',
//         phoneVerificationCode: json["phone_verification_code"] ?? '',
//         upgradedAt: json["upgraded_at"] ?? '',
//         emailVerifiedAt: json["email_verified_at"],
//         inactivateEndAt: json["inactivate_end_at"],
//         createdAt: json["created_at"] ?? '',
//         updatedAt: json["updated_at"] ?? '',
//         balanceFormatted: json["balance_formatted"] ?? '',
//         createdDate: json["created_date"] != null
//             ? DateTime.parse(json["created_date"])
//             : DateTime.now(),
//         upgradedDate: json["upgraded_date"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "token": token,
//         "name": name,
//         "username": username,
//         "email": email,
//         "image": image,
//         "address": address,
//         "phone": phone,
//         "balance": balance,
//         "message": message,
//         "account_info": List<dynamic>.from(accountInfo.map((x) => x.toJson())),
//         "plan_id": planId,
//         "role": role,
//         "refered_by": referedBy,
//         "confirmation_code": confirmationCode,
//         "phone_verified_at": phoneVerifiedAt,
//         "refcode": refcode,
//         "phone_verification_code": phoneVerificationCode,
//         "upgraded_at": upgradedAt,
//         "email_verified_at": emailVerifiedAt,
//         "inactivate_end_at": inactivateEndAt,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "balance_formatted": balanceFormatted,
//         "created_date": createdDate.toIso8601String(),
//         "upgraded_date": upgradedDate,
//       };
// }

// class AccountInfo {
//   String? currency;
//   String? value;

//   AccountInfo({
//     this.currency,
//     this.value,
//   });

//   factory AccountInfo.fromJson(Map<String, dynamic> json) {
//     return AccountInfo(
//       currency: json['currency'] as String?,
//       value: json['value'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'currency': currency,
//       'value': value,
//     };
//   }
// }
