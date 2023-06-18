import 'dart:convert';

import 'package:e_wallet_mobile/models/data_plan_form_model.dart';
import 'package:e_wallet_mobile/models/data_plan_model.dart';
import 'package:e_wallet_mobile/models/top_up_form_model.dart';
import 'package:e_wallet_mobile/models/transaction_model.dart';
import 'package:e_wallet_mobile/models/transfer_form_model.dart';
import 'package:e_wallet_mobile/service/auth_service.dart';
import 'package:e_wallet_mobile/shared/shared_value.dart';
import 'package:http/http.dart' as http;

class TransactionService  {
  Future<String> topUp(TopUpFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse("$baseUrl/top_ups"),
        headers: {
          "Authorization": token
        },
        body: data.toJson()
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)["redirect_url"];
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
          Uri.parse("$baseUrl/transfers"),
          headers: {
            "Authorization": token
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

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
          Uri.parse("$baseUrl/data_plans"),
          headers: {
            "Authorization": token
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

  Future<List<TransactionModel>> getTransaction() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse("$baseUrl/transactions"),
        headers: {
          "Authorization": token
        }
      );

      if (res.statusCode == 200) {
        return List<TransactionModel>.from(
          jsonDecode(res.body)["data"].map(
            (transaction) => TransactionModel.fromJson(transaction)
          )
        );
      } else {
        throw jsonDecode(res.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}