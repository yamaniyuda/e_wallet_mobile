import 'package:e_wallet_mobile/data/repositories/payment_method_repository_impl.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/payment_method_repository.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class FetchDataUseCase extends UseCase<PaymentMethodRepositoryImpl, String> {
  FetchDataUseCase()
    : super(PaymentMethodRepositoryImpl());

  @override
  Future<List<PaymentMethodEntity>> call([String? params]) async {
    return await repository.fetchData();
  }
}