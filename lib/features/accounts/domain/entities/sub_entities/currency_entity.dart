class CurrencyEntity {
  final String name;

  CurrencyEntity({
    required this.name,
  });
  factory CurrencyEntity.fromJson(Map<String, dynamic> json) => CurrencyEntity(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
