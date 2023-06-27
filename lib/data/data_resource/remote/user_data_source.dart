import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/data/payloads/user_update_payload.dart';

class UserDataSource extends RemoteDataSource {
  Future<UserDTO> fetchData({ Map<String, dynamic>? params }) async {
    final UserDTO response = await dioClient.getRequest<UserDTO>(
      "api/users",
      converter: (data) => UserDTO.fromJson(data)
    );

    return response;
  }

  Future<bool> updateData({ required UserUpdatePayload payload }) async {
    final bool response = await dioClient.postRequest(
      "api/users",
      converter: (data) {
        if (data["message"] == "Updated") return true;
        return false;
      },
      data: payload.toJson()
    );

    return response;
  }

  Future<List<UserDTO>> fetchDataList(String username) async {
    final List<UserDTO> response = await dioClient.getRequest(
      "api/users/$username",
      converter: (data) => List<UserDTO>.from(
        data.map((x) => UserDTO.fromJson(x))
      )
    );

    return response;
  }

  Future<bool> checkIsEmailExist({ required String payload }) async {
    final bool response = await dioClient.postRequest(
      "api/is-email-exist",
      converter: (data) => data["is_email_exist"],
      data: { "email": payload }
    );

    return response;
  }
}