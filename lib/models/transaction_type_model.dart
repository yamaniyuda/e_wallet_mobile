class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? action;
  final String? thumbnail;

  const TransactionTypeModel({
    this.name,
    this.id,
    this.code,
    this.action,
    this.thumbnail
  });

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) {
    return TransactionTypeModel(
        name: json["name"],
        id: json["id"],
        code: json["code"],
        action: json["action"],
        thumbnail: json["thumbnail"]
    );
  }
}