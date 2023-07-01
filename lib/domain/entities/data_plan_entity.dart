import 'package:equatable/equatable.dart';

class DataPlanEntity extends Equatable {
  late int? id;
  late String? name;
  late int? operatorCardId;
  late int? price;

  DataPlanEntity({
    this.id,
    this.price,
    this.name,
    this.operatorCardId
  });

  @override
  List<Object?> get props => [
    id, name, operatorCardId, price
  ];

  DataPlanEntity copyWith({
    int? id,
    String? name,
    int? price,
    int? operatorCardId
  }) {
    return DataPlanEntity(
      name: name ?? this.name,
      id: id ?? this.id,
      operatorCardId: operatorCardId ?? this.operatorCardId,
      price: price ?? this.price
    );
  }
}