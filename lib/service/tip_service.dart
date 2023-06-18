import 'dart:convert';

import 'package:e_wallet_mobile/models/tip_model.dart';
import 'package:e_wallet_mobile/service/auth_service.dart';
import 'package:e_wallet_mobile/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class TipService {
  Future<List<TipModel>> getTips() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse("$baseUrl/tips"),
        headers: {
          "Authorization": token
        }
      );

      if (res.statusCode == 200) {
        return List<TipModel>.from(
            jsonDecode(res.body)["data"].map(
                (e) => TipModel.fromJson(e)
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