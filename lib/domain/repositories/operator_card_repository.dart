import 'package:e_wallet_mobile/data/data_resource/remote/operator_card_data_source.dart';
import 'package:e_wallet_mobile/data/mappers/operator_card_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class OperatorCardRepository extends Repository {
  final OperatorCardDataSource dataSource;
  final OperatorCardMapper mapper;

  OperatorCardRepository({ required this.dataSource, required this.mapper });
  Future<List<OperatorCardEntity>> fetchData();
}