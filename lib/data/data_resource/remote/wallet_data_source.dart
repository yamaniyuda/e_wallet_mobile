import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/wallet_dto.dart';
import 'package:e_wallet_mobile/data/payloads/wallet_pin_update_payload.dart';

class WalletDataSource extends RemoteDataSource {
  Future<WalletDTO> fetchData() async {
    final WalletDTO response = await dioClient.getRequest<WalletDTO>(
      "api/wallets",
      converter: (data) => WalletDTO.fromJson(data)
    );

    return response;
  }

  Future<bool> pinUpdate({ required WalletPinUpdatePayload payload }) async {
    final bool response = await dioClient.postRequest(
      "api/wallets",
      converter: (data) {
        if (data["message"] == "Pin updated") return true;
        return false;
      },
      data: payload.toJson()
    );

    return response;
  }
}