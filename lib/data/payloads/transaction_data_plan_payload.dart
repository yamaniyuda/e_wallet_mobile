import 'dart:math';

class TransactionDataPlanPayload {
  final int? dataPlanId;
  final String? phoneNumber;
  final int? pin;

  TransactionDataPlanPayload({
    this.pin,
    this.dataPlanId,
    this.phoneNumber
  });

  Map<String, dynamic> toJson() {
    return {
      "data_plan_id": dataPlanId,
      "phone_number": phoneNumber,
      "pin": pin
    };
  }

  TransactionDataPlanPayload copyWith({
    int? dataPlanId,
    String? phoneNumber,
    int? pin
  }) {
    return TransactionDataPlanPayload(
      pin: pin ?? this.pin,
      dataPlanId: dataPlanId ?? this.dataPlanId,
      phoneNumber: phoneNumber ?? this.phoneNumber
    );
  }
}