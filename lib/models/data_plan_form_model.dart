class DataPlanFormModel {
  final int? dataPlanId;
  final String? phoneNumber;
  final String? pin;

  const DataPlanFormModel({
    this.pin,
    this.phoneNumber,
    this.dataPlanId
  });

  Map<String, dynamic> toJson() {
    return {
      "data_plan_id": dataPlanId.toString(),
      "phone_number": phoneNumber,
      "pin": pin
    };
  }
}