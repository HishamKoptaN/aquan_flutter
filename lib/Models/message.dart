import '../app/Auth/model/user.dart';

class Message {
  int? id;
  String? message;
  int? userId;
  int? chatId;
  String? createdAt;
  String? updatedAt;
  User? user;

  String? isFile;
  String? fileName;
  String? fileOriginalName;
  String? fileType;
  String? fileSize;
  String? fileUrl;

  Message({
    id,
    message,
    userId,
    chatId,
    createdAt,
    updatedAt,
    user,
  });

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    userId = json['user_id'];
    chatId = json['chat_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    isFile = json['is_file'];
    fileName = json['file_name'];
    fileOriginalName = json['file_original_name'];
    fileType = json['file_type'];
    fileSize = json['file_size'];
    fileUrl = json['file_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['message'] = message;
    data['user_id'] = userId;
    data['chat_id'] = chatId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
