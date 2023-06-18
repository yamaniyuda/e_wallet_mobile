class TopUpFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  const TopUpFormModel({
    this.amount,
    this.pin,
    this.paymentMethodCode
  });

  TopUpFormModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode
  }) {
    return TopUpFormModel(
      pin: pin ?? this.pin,
      amount: amount ?? this.amount,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "pin": pin,
      "payment_method_code": paymentMethodCode
    };
  }
}