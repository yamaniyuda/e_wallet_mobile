import 'package:e_wallet_mobile/data/data_resource/remote/transaction_data_source.dart';
import 'package:e_wallet_mobile/data/mappers/transaction_mapper.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_data_plan_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/data/payloads/transaction_transfer_payload.dart';
import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class TransactionRepository extends Repository {
  final TransactionDataSource dataSource;
  final TransactionMapper mapper;

  TransactionRepository(this.dataSource, this.mapper);
  Future fetchTransferHistory({ Map<String, dynamic> queryParameters = const { "limit": 10 } });
  Future fetchData({ Map<String, dynamic>? queryParameters });
  Future topUp({ required TransactionTopUpPayload payload });
  Future transfer({ required TransactionTransferPayload payload });
  Future dataPlan({ required TransactionDataPlanPayload payload });
}