import 'package:equatable/equatable.dart';

class PaymentMethodEntity extends Equatable {
  late int? id;
  late String? name;
  late String? code;
  late String? thumbnail;
  late String? status;

  PaymentMethodEntity({
    this.id,
    this.name,
    this.thumbnail,
    this.status,
    this.code
  });

  @override
  List<Object?> get props => [
    id, name, code, thumbnail, status
  ];

  PaymentMethodEntity copyWith({
    int? id,
    String? name,
    String? thumbnail,
    String? status,
    String? code
  }) {
    return PaymentMethodEntity(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      code: code ?? this.code,
      name: name ?? this.name,
      status: status ?? this.status
    );
  }
}