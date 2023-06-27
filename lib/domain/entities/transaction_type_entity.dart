import 'package:equatable/equatable.dart';

class TransactionTypeEntity extends Equatable {
  late int? id;
  late String? code;
  late String? name;
  late String? action;
  late String? thumbnail;

  TransactionTypeEntity({
    this.id,
    this.name,
    this.thumbnail,
    this.action,
    this.code
  });

  @override
  List<Object?> get props => [
    id, code, name, action, thumbnail
  ];

  TransactionTypeEntity copyWith({
    int? id,
    String? code,
    String? name,
    String? action,
    String? thumbnail
  }) {
    return TransactionTypeEntity(
      name: name ?? this.name,
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      code: code ?? this.code,
      action: action ?? this.action
    );
  }
}