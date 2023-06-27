import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/transaction_dto.dart';
import 'package:e_wallet_mobile/data/dto/transaction_top_up_dto.dart';
import 'package:e_wallet_mobile/data/dto/transfer_history_dto.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_data_plan_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_transfer_payload.dart';

class TransactionDataSource extends RemoteDataSource {
  Future<List<TransactionDTO>> fetchData({ Map<String, dynamic>? queryParameters }) async {
    final List<TransactionDTO> response = await dioClient.getRequest<List<TransactionDTO>>(
      "api/transactions",
      converter: (data) => List<TransactionDTO>.from(
        data["data"].map((data) => TransactionDTO.fromJson(data))
      ),
      queryParameters: queryParameters
    );

    return response;
  }

  Future<TransactionTopUpDTO> topUp({ required TransactionTopUpPayload payload }) async {
    final TransactionTopUpDTO response = await dioClient.postRequest(
      "api/top_ups",
      converter: (data) => TransactionTopUpDTO.fromJson(data),
      data: payload.toJson()
    );

    return response;
  }

  Future<bool> transfer({ required TransactionTransferPayload payload }) async {
    final bool response = await dioClient.postRequest(
      "api/transfers",
      converter: (data) {
        if (data["message"] == "Transfer Success") return true;
        return false;
      },
      data: payload.toJson()
    );

    return response;
  }

  Future<bool> dataPlan({ required TransactionDataPlanPayload payload }) async {
    final bool response = await dioClient.postRequest<bool>(
      "api/data_plans",
      converter: (data) {
        if (data["message"] == "Buy Data Plan Success") return true;
        return false;
      },
      data: payload.toJson()
    );

    return response;
  }

  Future<List<UserDTO>> fetchTransferHistory({ Map<String, dynamic> queryParameters = const { "limit": 10 } }) async {
    final List<UserDTO> response = await dioClient.getRequest(
      "api/transfer_histories",
      converter: (data) => List<UserDTO>.from(
        data["data"].map((x) => UserDTO.fromJson(x))
      ),
      queryParameters: queryParameters
    );

    return response;
  }
}