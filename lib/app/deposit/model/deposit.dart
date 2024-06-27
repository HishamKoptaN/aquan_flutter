class Deposit {
  int? id;
  String? status;
  double? amount;
  double? rate;
  double? charge;
  String? method;
  String? transaction;
  String? proof;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Deposit({
    id,
    status,
    amount,
    rate,
    charge,
    method,
    transaction,
    proof,
    userId,
    createdAt,
    updatedAt,
  });

  Deposit.fromJson(Map<String, dynamic> json) {
    // try {
    id = json['id'];
    status = json['status'];
    amount = json['amount'].toDouble();
    rate = json['rate'].toDouble();
    charge = json['charge'].toDouble();
    method = json['method'];
    transaction = json['transaction'];
    proof = json['proof'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // } catch (e) {
    //   print(json['amount'].runtimeType);
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['status'] = status;
    data['amount'] = amount;
    data['rate'] = rate;
    data['charge'] = charge;
    data['method'] = method;
    data['transaction'] = transaction;
    data['proof'] = proof;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
