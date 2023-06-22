import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/tip_dto.dart';

class TipDataSource extends RemoteDataSource {
  Future<List<TipDTO>> fetchData({ Map<String, dynamic>? queryParameters }) async {
    final List<TipDTO> response = await dioClient.getRequest(
      "api/tips",
      converter: (data) => List<TipDTO>.from(
        data["data"].map((x) => TipDTO.fromJson(x))
      )
    );

    return response;
  }
}