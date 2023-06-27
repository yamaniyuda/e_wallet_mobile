import 'package:e_wallet_mobile/data/repositories/tip_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/tip_entity.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class GetTipUseCase extends UseCase<TipRepositoryImpl, String> {
  GetTipUseCase() : super(TipRepositoryImpl());

  @override
  Future<List<TipEntity>> call([String? params]) async {
    return repository.getTips();
  }
}