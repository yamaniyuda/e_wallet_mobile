import 'package:e_wallet_mobile/config/api/dio_client.dart';
import 'package:e_wallet_mobile/data/dto/dto.dart';

abstract class RemoteDataSource {
  final DioClient _dioClient;

  RemoteDataSource(): _dioClient = DioClient();
  DioClient get dioClient => _dioClient;
}