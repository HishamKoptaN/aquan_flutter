class Task {
  late int id;
  late String name;
  late String description;
  late double amount;
  late String createdAt;
  late String updatedAt;
  late String status;
  late String? link;
  late String? image;
  late String? imageUrl;

  late String amountFormated;

  Task({
    required id,
    required name,
    required description,
    required amount,
    required createdAt,
    required updatedAt,
    required status,
    required link,
    image,
    imageUrl,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    amount = json['amount'].toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    amountFormated = json['amount_formated'];
    link = json['link'];
    image = json['image'];
    imageUrl = json['image_url'];
  }
}
