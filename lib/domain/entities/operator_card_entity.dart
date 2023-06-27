import 'package:e_wallet_mobile/domain/entities/data_plan_entity.dart';
import 'package:equatable/equatable.dart';

class OperatorCardEntity extends Equatable {
  late int? id;
  late String? name;
  late String? status;
  late String? thumbnail;
  late DataPlanEntity? dataPlans;

  OperatorCardEntity({
    this.id,
    this.name,
    this.thumbnail,
    this.status,
    this.dataPlans
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id, name, status, thumbnail, dataPlans
  ];

  OperatorCardEntity copyWith({
    int? id,
    String? name,
    String? status,
    String? thumbnail,
    DataPlanEntity? dataPlans
  }) {
    return OperatorCardEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      thumbnail: thumbnail ?? this.thumbnail,
      dataPlans: dataPlans ?? this.dataPlans
    );
  }
}