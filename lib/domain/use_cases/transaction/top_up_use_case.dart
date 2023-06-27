import 'package:e_wallet_mobile/data/payloads/transaction_top_up_payload.dart';
import 'package:e_wallet_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_top_up_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class TopUpUseCase extends UseCase<TransactionRepositoryImpl, TransactionTopUpPayload> {
  TopUpUseCase()
    : super(TransactionRepositoryImpl());

  @override
  Future<TransactionTopUpEntity?> call([TransactionTopUpPayload? params]) async {
    return await repository.topUp(payload: params!);
  }
}