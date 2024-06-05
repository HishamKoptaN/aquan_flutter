class Currency {
  int? id;
  String? status;
  String? name;
  String? nameCode;
  double? sellingRate;
  double? buyingRate;
  Data? paymentInfo;
  String? createdAt;
  String? updatedAt;
  String? updatedDate;
  String? comment;
//   List<dynamic>? data;
  Map<String, dynamic>? rates;

  Currency({
    id,
    status,
    name,
    nameCode,
    sellingRate,
    buyingRate,
    paymentInfo,
    createdAt,
    updatedAt,
    updatedDate,
    // data,
    comment,
    rates,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    nameCode = json['name_code'];
    sellingRate = json['selling_rate'].toDouble();
    buyingRate = json['buying_rate'].toDouble();
    createdAt = json['created_at'];
    paymentInfo = json['payment_info'] != null
        ? Data.fromJson(json['payment_info'])
        : null;
    updatedAt = json['updated_at'];
    updatedDate = json['updated_date'];
    // data = json['data'];
    rates = json['rates'];
    comment = json['comment'];
  }
}

class Data {
  String? name;
  String? accountId;

  Data({this.name, this.accountId});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountId = json['accountId'];
  }
}
