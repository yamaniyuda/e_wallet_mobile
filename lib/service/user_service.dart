import 'dart:convert';

import 'package:e_wallet_mobile/models/user_model.dart';
import 'package:e_wallet_mobile/models/user_update_form_model.dart';
import 'package:e_wallet_mobile/service/auth_service.dart';
import 'package:e_wallet_mobile/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserUpdateFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.put(
        Uri.parse("$baseUrl/users"),
        headers: {
          "Authorization": token,
        },
        body: data.toJson()
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse("$baseUrl/transfer_histories"),
        headers: {
          "Authorization": token
        }
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
            jsonDecode(res.body)["data"].map(
                (user) => UserModel.fromJson(user)
            )
        ).toList();
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
          Uri.parse("$baseUrl/users/$username"),
          headers: {
            "Authorization": token
          }
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
            jsonDecode(res.body).map(
                    (user) => UserModel.fromJson(user)
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