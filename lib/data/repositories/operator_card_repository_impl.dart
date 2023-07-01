import 'package:e_wallet_mobile/data/data_resource/remote/operator_card_data_source.dart';
import 'package:e_wallet_mobile/data/dto/operator_card_dto.dart';
import 'package:e_wallet_mobile/data/mappers/operator_card_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/operator_card_repository.dart';

class OperatorCardRepositoryImpl extends OperatorCardRepository {
  OperatorCardRepositoryImpl()
    : super(dataSource: OperatorCardDataSource(), mapper: OperatorCardMapper());

  @override
  Future<List<OperatorCardEntity>> fetchData() async {
    try {
      final List<OperatorCardDTO> dataDTO = await dataSource.fetchData();
      final List<OperatorCardEntity> dataEntity = List<OperatorCardEntity>.from(
          dataDTO.map((dto) => mapper.convert<OperatorCardDTO, OperatorCardEntity>(dto))
      );
      return dataEntity;
    } catch (_) {
      return [];
    }
  }
}