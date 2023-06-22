class TransactionTransferPayload {
  final int? amount;
  final int? pin;
  final String? sendTo;

  TransactionTransferPayload({
    this.sendTo,
    this.amount,
    this.pin
  });

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "pin": pin,
      "send_to": sendTo
    };
  }

  TransactionTransferPayload copyWith({
    int? amount,
    int? pin,
    String? sendTo
  }) {
    return TransactionTransferPayload(
      pin: pin ?? this.pin,
      amount: amount ?? this.amount,
      sendTo: sendTo ?? this.sendTo
    );
  }
}