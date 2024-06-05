class Invoice {
  int? id;
  String? status;
  String? type;
  int? amount;
  String? attachement;
  String? message;
  Data? data;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? amountFormated;
  String? createdDate;

  Invoice({
    this.id,
    this.status,
    this.type,
    this.amount,
    this.attachement,
    this.message,
    this.data,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.amountFormated,
    this.createdDate,
  });

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    type = json['type'];
    amount = json['amount'];
    attachement = json['attachement'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    userId = json['user_id'];
    createdAt = json['created_at'];
    createdDate = json['created_date'];
    updatedAt = json['updated_at'];
    amountFormated = json['amount_formated'];
  }
}

class Data {
  String? method;
  String? wallet;

  Data({this.method});

  Data.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    wallet = json['wallet'];
  }
}
