import 'dart:convert';

import 'package:e_wallet_mobile/service/auth_service.dart';
import 'package:e_wallet_mobile/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class WalletService {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.put(
          Uri.parse("$baseUrl/wallets"),
          headers: {
            "Authorization": token,
          },
          body: {
            "previous_pin": oldPin,
            "new_pin": newPin
          }
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}