import 'dart:convert';

GetSupportApiResModel getSupportApiResModelFromJson(String str) =>
    GetSupportApiResModel.fromJson(json.decode(str));

String getSupportApiResModelToJson(GetSupportApiResModel data) =>
    json.encode(data.toJson());

class GetSupportApiResModel {
  bool? status;
  List<Message>? messages;

  GetSupportApiResModel({
    this.status,
    this.messages,
  });

  factory GetSupportApiResModel.fromJson(Map<String, dynamic> json) =>
      GetSupportApiResModel(
        status: json["status"],
        messages: json["messages"] == null
            ? []
            : List<Message>.from(
                json["messages"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": messages == null
            ? []
            : List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
}

class Message {
  int? id;
  String? message;
  String? isFile;
  dynamic fileName;
  dynamic fileOriginalName;
  dynamic fileType;
  dynamic fileSize;
  int? userId;
  int? chatId;
  dynamic readedAt;
  String? createdAt;
  String? updatedAt;

  Message({
    this.id,
    this.message,
    this.isFile,
    this.fileName,
    this.fileOriginalName,
    this.fileType,
    this.fileSize,
    this.userId,
    this.chatId,
    this.readedAt,
    this.createdAt,
    this.updatedAt,
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
      };
}
