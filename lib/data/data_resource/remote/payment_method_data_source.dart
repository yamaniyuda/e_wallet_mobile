import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/payment_method_dto.dart';

class PaymentMethodDataSource extends RemoteDataSource {
  Future<List<PaymentMethodDTO>> fetchData() async {
    final List<PaymentMethodDTO> response = await dioClient.getRequest(
      "api/payment_methods",
      converter: (data) => List<PaymentMethodDTO>.from(
        data.map((x) => PaymentMethodDTO.fromJson(x))
      )
    );

    return response;
  }
}