import 'package:equatable/equatable.dart';

class DataPlanEntity extends Equatable {
  late int? id;
  late String? name;
  late int? operatorCardId;

  DataPlanEntity({
    this.id,
    this.name,
    this.operatorCardId
  });

  @override
  List<Object?> get props => [
    id, name, operatorCardId
  ];

  DataPlanEntity copyWith({
    int? id,
    String? name,
    int? operatorCardId
  }) {
    return DataPlanEntity(
      name: name ?? this.name,
      id: id ?? this.id,
      operatorCardId: operatorCardId ?? this.operatorCardId
    );
  }
}