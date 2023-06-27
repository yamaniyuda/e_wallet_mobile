import 'package:equatable/equatable.dart';

class WalletEntity extends Equatable {
  late int? balance;
  late String? cardNumber;

  WalletEntity({
    this.cardNumber,
    this.balance
  });

  @override
  List<Object?> get props => [balance, cardNumber];

  WalletEntity copyWith({ int? balance, String? cardNumber }) {
    return WalletEntity(
      balance: balance ?? this.balance,
      cardNumber: cardNumber ?? this.cardNumber
    );
  }
}