import 'package:e_wallet_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class FetchTransactionUseCase extends UseCase<TransactionRepositoryImpl, Map<String, dynamic>> {
  FetchTransactionUseCase() : super(TransactionRepositoryImpl());

  @override
  Future<List<TransactionEntity>> call([Map<String, dynamic>? params]) async {
    return await repository.fetchData(queryParameters: params);
  }
}