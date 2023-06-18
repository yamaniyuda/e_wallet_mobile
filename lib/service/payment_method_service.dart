import 'dart:convert';

import 'package:e_wallet_mobile/models/payment_method_model.dart';
import 'package:e_wallet_mobile/service/auth_service.dart';
import 'package:e_wallet_mobile/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse("$baseUrl/payment_methods"),
        headers: {
          "Authorization": token
        }
      );

      if (res.statusCode == 200) {
        late List test = List.from(jsonDecode(res.body)).map(
          (data) => PaymentMethodModel.fromJson(data)
        ).toList();
        return test as List<PaymentMethodModel>;
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e, stacktrace) {
      rethrow;
    }
  }
}