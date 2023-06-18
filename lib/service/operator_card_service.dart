import 'dart:convert';

import 'package:e_wallet_mobile/models/operator_card_model.dart';
import 'package:e_wallet_mobile/service/auth_service.dart';
import 'package:e_wallet_mobile/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class OperatorCardService {
  Future<List<OperatorCardModel>> getOperatorCards() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse("$baseUrl/operator_cards"),
        headers: {
          "Authorization": token
        }
      );

      if (res.statusCode == 200) {
        return List<OperatorCardModel>.from(
            jsonDecode(res.body)["data"].map(
                (operator) => OperatorCardModel.fromJson(operator)
            )
        ).toList();
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}