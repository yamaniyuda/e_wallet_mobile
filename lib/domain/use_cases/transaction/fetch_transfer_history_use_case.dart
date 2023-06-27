import 'package:e_wallet_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/transfer_history_entity.dart';
import 'package:e_wallet_mobile/domain/entities/user_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class FetchTransferHistoryUseCase extends UseCase<TransactionRepositoryImpl, Map<String, dynamic>> {
  FetchTransferHistoryUseCase() : super(TransactionRepositoryImpl());

  @override
  Future<List<UserEntity>> call([Map<String, dynamic>? params]) async {
    return await repository.fetchTransferHistory();
  }
}