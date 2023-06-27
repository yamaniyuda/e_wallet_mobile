import 'package:e_wallet_mobile/data/data_resource/remote/transaction_data_source.dart';
import 'package:e_wallet_mobile/data/dto/transaction_dto.dart';
import 'package:e_wallet_mobile/data/dto/transaction_top_up_dto.dart';
import 'package:e_wallet_mobile/data/dto/user_dto.dart';
import 'package:e_wallet_mobile/data/mappers/transaction_mapper.dart';
import 'package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart';
import 'package:e_wallet_mobile/data/mappers/user_mapper.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_transfer_payload.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_entity.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_top_up_entity.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  late final UserMapper userMapper;
  late final TransactionTopUpMapper transactionTopUpMapper;

  TransactionRepositoryImpl() : super(TransactionDataSource(), TransactionMapper()) {
    userMapper = UserMapper();
    transactionTopUpMapper = TransactionTopUpMapper();
  }

  @override
  Future<TransactionTopUpEntity?> topUp({required TransactionTopUpPayload payload}) async {
    try {
      final TransactionTopUpDTO dataDTO = await dataSource.topUp(payload: payload);
      final TransactionTopUpEntity dataEntity = transactionTopUpMapper.convert<TransactionTopUpDTO, TransactionTopUpEntity>(dataDTO);
      return dataEntity;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<UserEntity>> fetchTransferHistory({
    Map<String, dynamic> queryParameters = const {"limit" : 10}
  }) async {
    try {
      final List<UserDTO> dataDTO = await dataSource.fetchTransferHistory(queryParameters: queryParameters);
      final List<UserEntity> dataEntity = List<UserEntity>.from(
        dataDTO.map(
          (dto) => mapper.convert<UserDTO, UserEntity>(dto)
        )
      );
      return dataEntity;
    } catch (e) {
      return <UserEntity>[];
    }
  }

  @override
  Future<List<TransactionEntity>> fetchData({Map<String, dynamic>? queryParameters}) async {
    try {
      final List<TransactionDTO> transactionDTO = await dataSource.fetchData(queryParameters: queryParameters);
      final List<TransactionEntity> transferHistoryEntity = List<TransactionEntity>.from(
        transactionDTO.map(
          (dto) => mapper.convert<TransactionDTO, TransactionEntity>(dto)
        )
      );
      return transferHistoryEntity;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> transfer({required TransactionTransferPayload payload}) async {
    try {
      final bool data = await dataSource.transfer(payload: payload);
      return data;
    } catch (e) {
      return false;
    }
  }
}