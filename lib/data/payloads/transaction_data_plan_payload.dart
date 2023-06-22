import 'dart:math';

class TransactionDataPlanPayload {
  final int? id;
  final String? phoneNumber;
  final int? pin;

  TransactionDataPlanPayload({
    this.pin,
    this.id,
    this.phoneNumber
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "phone_number": phoneNumber,
      "pin": pin
    };
  }

  TransactionDataPlanPayload copyWith({
    int? id,
    String? phoneNumber,
    int? pin
  }) {
    return TransactionDataPlanPayload(
      pin: pin ?? this.pin,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber
    );
  }
}