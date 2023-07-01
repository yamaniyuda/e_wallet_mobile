import 'package:e_wallet_mobile/data/payloads/transaction_data_plan_payload.dart';
import 'package:e_wallet_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class DataPlanUseCase extends UseCase<TransactionRepositoryImpl, TransactionDataPlanPayload> {
  DataPlanUseCase() : super(TransactionRepositoryImpl());

  @override
  Future<bool> call([TransactionDataPlanPayload? params]) async {
    return await repository.dataPlan(payload: params!);
  }
}