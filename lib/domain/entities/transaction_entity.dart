import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_type_entity.dart';
import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  late int? id;
  late int? amount;
  late DateTime? createdAt;
  late PaymentMethodEntity? paymentMethod;
  late TransactionTypeEntity? transactionType;

  TransactionEntity({
    this.paymentMethod,
    this.createdAt,
    this.amount,
    this.id,
    this.transactionType
  });

  @override
  List<Object?> get props => [
    id, amount, createdAt, paymentMethod, transactionType
  ];

  TransactionEntity copyWith({
    int? id,
    int? amount,
    DateTime? createdAt,
    PaymentMethodEntity? paymentMethod,
    TransactionTypeEntity? transactionType
  }) {
    return TransactionEntity(
      createdAt: createdAt ?? this.createdAt,
      amount: amount ?? this.amount,
      id: id ?? this.id,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionType: transactionType ?? this.transactionType
    );
  }
}