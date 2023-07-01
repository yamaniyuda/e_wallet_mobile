import 'package:e_wallet_mobile/data/repositories/operator_card_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class FetchDataUseCase extends UseCase<OperatorCardRepositoryImpl, String> {
  FetchDataUseCase()
      : super(OperatorCardRepositoryImpl());

  @override
  Future<List<OperatorCardEntity>> call([String? params]) async {
    return await repository.fetchData();
  }
}