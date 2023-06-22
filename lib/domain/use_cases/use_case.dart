import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class UseCase<R extends Repository, Params> {
  final R repository;
  UseCase(this.repository);
  Future call([Params? params]);
}