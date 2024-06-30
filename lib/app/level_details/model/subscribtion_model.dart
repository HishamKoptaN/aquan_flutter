import 'dart:convert';

SubscribtionModel subscribtionModelFromJson(String str) =>
    SubscribtionModel.fromJson(json.decode(str));

String subscribtionModelToJson(SubscribtionModel data) =>
    json.encode(data.toJson());

class SubscribtionModel {
  int? planId;
  DateTime? startDate;
  DateTime? endDate;

  SubscribtionModel({
    this.planId,
    this.startDate,
    this.endDate,
  });

  factory SubscribtionModel.fromJson(Map<String, dynamic> json) =>
      SubscribtionModel(
        planId: json["plan_id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "plan_id": planId,
        "start_date": startDate != null
            ? startDate!.toIso8601String().substring(0, 10)
            : null,
        "end_date": endDate != null
            ? endDate!.toIso8601String().substring(0, 10)
            : null,
      };
}
