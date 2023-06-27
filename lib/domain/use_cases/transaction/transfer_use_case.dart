import 'package:e_wallet_mobile/data/payloads/transaction_transfer_payload.dart';
import 'package:e_wallet_mobile/data/repositories/transaction_repository_impl.dart';
import 'package:e_wallet_mobile/domain/use_cases/use_case.dart';

class TransferUseCase extends UseCase<TransactionRepositoryImpl, TransactionTransferPayload> {
  TransferUseCase() : super(TransactionRepositoryImpl());

  @override
  Future<bool> call([TransactionTransferPayload? params]) {
    return repository.transfer(payload: params!);
  }
}