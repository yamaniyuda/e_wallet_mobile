import 'package:e_wallet_mobile/data/data_resource/remote/remote_data_source.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/data/payloads/sign_in_payload.dart';
import 'package:e_wallet_mobile/data/payloads/sign_up_payload.dart';

class AuthDataSource extends RemoteDataSource {
  Future<UserDTO> register({ required SignUpPayload payload }) async {
    final UserDTO response = await dioClient.postRequest(
      "api/register",
      converter: (data) => UserDTO.fromJson(data),
      data: payload.toJson()
    );

    return response;
  }

  Future<UserDTO> login({ required SignInPayload payload }) async {
    final UserDTO response = await dioClient.postRequest<UserDTO>(
      "api/login",
      converter: (data) => UserDTO.fromJson(data),
      data: payload.toJson()
    );

    return response;
  }

  Future<bool> logout() async {
    final bool response = await dioClient.postRequest<bool>(
      "api/logout",
      converter: (data) {
        if (data["message"] == "Log out success") return true;
        return false;
      },
      data: {}
    );

    return response;
  }
}