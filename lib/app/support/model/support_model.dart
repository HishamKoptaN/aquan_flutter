// To parse this JSON data, do
//
//     final getChatApiRes = getChatApiResFromJson(jsonString);

import 'dart:convert';

GetChatApiRes getChatApiResFromJson(String str) =>
    GetChatApiRes.fromJson(json.decode(str));

String getChatApiResToJson(GetChatApiRes data) => json.encode(data.toJson());

class GetChatApiRes {
  bool status;
  List<Message> messages;
  GetChatApiResUser user;

  GetChatApiRes({
    required this.status,
    required this.messages,
    required this.user,
  });

  factory GetChatApiRes.fromJson(Map<String, dynamic> json) => GetChatApiRes(
        status: json["status"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        user: GetChatApiResUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "user": user.toJson(),
      };
}

class Message {
  int id;
  String message;
  String isFile;
  dynamic fileName;
  dynamic fileOriginalName;
  dynamic fileType;
  dynamic fileSize;
  int userId;
  int chatId;
  dynamic readedAt;
  String createdAt;
  String updatedAt;
  dynamic fileUrl;
  MessageUser user;

  Message({
    required this.id,
    required this.message,
    required this.isFile,
    required this.fileName,
    required this.fileOriginalName,
    required this.fileType,
    required this.fileSize,
    required this.userId,
    required this.chatId,
    required this.readedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUrl,
    required this.user,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        message: json["message"],
        isFile: json["is_file"],
        fileName: json["file_name"],
        fileOriginalName: json["file_original_name"],
        fileType: json["file_type"],
        fileSize: json["file_size"],
        userId: json["user_id"],
        chatId: json["chat_id"],
        readedAt: json["readed_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        fileUrl: json["file_url"],
        user: MessageUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "is_file": isFile,
        "file_name": fileName,
        "file_original_name": fileOriginalName,
        "file_type": fileType,
        "file_size": fileSize,
        "user_id": userId,
        "chat_id": chatId,
        "readed_at": readedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "file_url": fileUrl,
        "user": user.toJson(),
      };
}

class MessageUser {
  int id;
  String status;
  String token;
  String name;
  String username;
  String email;
  String image;
  String? address;
  String? phone;
  int balance;
  dynamic message;
  List<AccountInfo> accountInfo;
  int planId;
  int role;
  dynamic referedBy;
  dynamic confirmationCode;
  String phoneVerifiedAt;
  String refcode;
  String phoneVerificationCode;
  String upgradedAt;
  dynamic emailVerifiedAt;
  dynamic inactivateEndAt;
  String createdAt;
  String updatedAt;
  String balanceFormatted;
  DateTime createdDate;
  String upgradedDate;

  MessageUser({
    required this.id,
    required this.status,
    required this.token,
    required this.name,
    required this.username,
    required this.email,
    required this.image,
    required this.address,
    required this.phone,
    required this.balance,
    required this.message,
    required this.accountInfo,
    required this.planId,
    required this.role,
    required this.referedBy,
    required this.confirmationCode,
    required this.phoneVerifiedAt,
    required this.refcode,
    required this.phoneVerificationCode,
    required this.upgradedAt,
    required this.emailVerifiedAt,
    required this.inactivateEndAt,
    required this.createdAt,
    required this.updatedAt,
    required this.balanceFormatted,
    required this.createdDate,
    required this.upgradedDate,
  });

  factory MessageUser.fromJson(Map<String, dynamic> json) => MessageUser(
        id: json["id"],
        status: json["status"],
        token: json["token"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        address: json["address"],
        phone: json["phone"],
        balance: json["balance"],
        message: json["message"],
        accountInfo: List<AccountInfo>.from(
            json["account_info"].map((x) => AccountInfo.fromJson(x))),
        planId: json["plan_id"],
        role: json["role"],
        referedBy: json["refered_by"],
        confirmationCode: json["confirmation_code"],
        phoneVerifiedAt: json["phone_verified_at"],
        refcode: json["refcode"],
        phoneVerificationCode: json["phone_verification_code"],
        upgradedAt: json["upgraded_at"],
        emailVerifiedAt: json["email_verified_at"],
        inactivateEndAt: json["inactivate_end_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        balanceFormatted: json["balance_formatted"],
        createdDate: DateTime.parse(json["created_date"]),
        upgradedDate: json["upgraded_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "token": token,
        "name": name,
        "username": username,
        "email": email,
        "image": image,
        "address": address,
        "phone": phone,
        "balance": balance,
        "message": message,
        "account_info": List<dynamic>.from(accountInfo.map((x) => x.toJson())),
        "plan_id": planId,
        "role": role,
        "refered_by": referedBy,
        "confirmation_code": confirmationCode,
        "phone_verified_at": phoneVerifiedAt,
        "refcode": refcode,
        "phone_verification_code": phoneVerificationCode,
        "upgraded_at": upgradedAt,
        "email_verified_at": emailVerifiedAt,
        "inactivate_end_at": inactivateEndAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "balance_formatted": balanceFormatted,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "upgraded_date": upgradedDate,
      };
}

class AccountInfo {
  String currency;
  int value;

  AccountInfo({
    required this.currency,
    required this.value,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}

class GetChatApiResUser {
  int id;
  String status;
  String token;
  String name;
  String username;
  String email;
  String image;
  String address;
  String phone;
  int balance;
  dynamic message;
  List<AccountInfo> accountInfo;
  int planId;
  int role;
  dynamic referedBy;
  dynamic confirmationCode;
  String phoneVerifiedAt;
  String refcode;
  String phoneVerificationCode;
  String upgradedAt;
  dynamic emailVerifiedAt;
  dynamic inactivateEndAt;
  String createdAt;
  String updatedAt;
  String balanceFormatted;
  DateTime createdDate;
  String upgradedDate;

  GetChatApiResUser({
    required this.id,
    required this.status,
    required this.token,
    required this.name,
    required this.username,
    required this.email,
    required this.image,
    required this.address,
    required this.phone,
    required this.balance,
    required this.message,
    required this.accountInfo,
    required this.planId,
    required this.role,
    required this.referedBy,
    required this.confirmationCode,
    required this.phoneVerifiedAt,
    required this.refcode,
    required this.phoneVerificationCode,
    required this.upgradedAt,
    required this.emailVerifiedAt,
    required this.inactivateEndAt,
    required this.createdAt,
    required this.updatedAt,
    required this.balanceFormatted,
    required this.createdDate,
    required this.upgradedDate,
  });

  factory GetChatApiResUser.fromJson(Map<String, dynamic> json) =>
      GetChatApiResUser(
        id: json["id"],
        status: json["status"],
        token: json["token"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        address: json["address"],
        phone: json["phone"],
        balance: json["balance"],
        message: json["message"],
        accountInfo: List<AccountInfo>.from(
            json["account_info"].map((x) => AccountInfo.fromJson(x))),
        planId: json["plan_id"],
        role: json["role"],
        referedBy: json["refered_by"],
        confirmationCode: json["confirmation_code"],
        phoneVerifiedAt: json["phone_verified_at"],
        refcode: json["refcode"],
        phoneVerificationCode: json["phone_verification_code"],
        upgradedAt: json["upgraded_at"],
        emailVerifiedAt: json["email_verified_at"],
        inactivateEndAt: json["inactivate_end_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        balanceFormatted: json["balance_formatted"],
        createdDate: DateTime.parse(json["created_date"]),
        upgradedDate: json["upgraded_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "token": token,
        "name": name,
        "username": username,
        "email": email,
        "image": image,
        "address": address,
        "phone": phone,
        "balance": balance,
        "message": message,
        "account_info": List<dynamic>.from(accountInfo.map((x) => x.toJson())),
        "plan_id": planId,
        "role": role,
        "refered_by": referedBy,
        "confirmation_code": confirmationCode,
        "phone_verified_at": phoneVerifiedAt,
        "refcode": refcode,
        "phone_verification_code": phoneVerificationCode,
        "upgraded_at": upgradedAt,
        "email_verified_at": emailVerifiedAt,
        "inactivate_end_at": inactivateEndAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "balance_formatted": balanceFormatted,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "upgraded_date": upgradedDate,
      };
}
