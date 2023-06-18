class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;

  const PaymentMethodModel({
    this.name,
    this.id,
    this.code,
    this.thumbnail
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      name: json["name"],
      id: json["id"],
      code: json["code"],
      thumbnail: json["thumbnail"]
    );
  }
}