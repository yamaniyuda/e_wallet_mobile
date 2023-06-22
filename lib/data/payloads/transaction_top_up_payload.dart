class TransactionTopUpPayload {
  final int? amount;
  final int? pin;
  final String? paymentMethodCode;

  TransactionTopUpPayload({
    this.pin,
    this.amount,
    this.paymentMethodCode
  });

  Map<String, dynamic> toJson() {
    return {
      "pin": pin,
      "amount": amount,
      "payment_method_code": paymentMethodCode
    };
  }

  TransactionTopUpPayload copyWith({
    int? amount,
    int? pin,
    String? paymentMethodCode
  }) {
    return TransactionTopUpPayload(
      amount: amount ?? this.amount,
      pin: pin ?? this.pin,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode
    );
  }
}