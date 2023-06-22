class WalletPinUpdatePayload {
  final int? previousPin;
  final int? newPin;

  WalletPinUpdatePayload({
    this.newPin,
    this.previousPin
  });

  Map<String, dynamic> toJson() {
    return {
      "previous_pin": previousPin,
      "new_pin": newPin
    };
  }

  WalletPinUpdatePayload copyWith({
    int? newPin,
    int? previousPin
  }) {
    return WalletPinUpdatePayload(
      newPin: newPin ?? this.newPin,
      previousPin: previousPin ?? this.previousPin
    );
  }
}