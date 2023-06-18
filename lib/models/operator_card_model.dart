import 'data_plan_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  const OperatorCardModel({
    this.name,
    this.id,
    this.thumbnail,
    this.status,
    this.dataPlans
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) {
    return OperatorCardModel(
      name: json["name"],
      id: json["id"],
      thumbnail: json["thumbnail"],
      status: json["status"],
      dataPlans: json["data_plans"] == null
        ? null
        : (json["data_plans"] as List).map((e) => DataPlanModel.fromJson(e)).toList()
    );
  }
}