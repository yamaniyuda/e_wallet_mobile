import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/operator_card_dto.dart';
import 'package:e_wallet_mobile/data/dto/payment_method_dto.dart';

class OperatorCardDataSource extends RemoteDataSource {
  Future<List<OperatorCardDTO>> fetchData() async {
    final List<OperatorCardDTO> response = await dioClient.getRequest(
        "api/operator_cards",
        converter: (data) => List<OperatorCardDTO>.from(
            data["data"].map((x) => OperatorCardDTO.fromJson(x))
        )
    );

    return response;
  }
}