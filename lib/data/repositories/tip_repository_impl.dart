import 'package:e_wallet_mobile/data/data_resource/remote/tip_data_source.dart';
import 'package:e_wallet_mobile/data/dto/tip_dto.dart';
import 'package:e_wallet_mobile/data/mappers/tip_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/tip_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/tip_repository.dart';

class TipRepositoryImpl extends TipRepository {
  TipRepositoryImpl()
    : super(TipDataSource(), TipMapper());

  @override
  Future<List<TipEntity>> getTips({Map<String, dynamic>? queryParameters}) async {
    try {
      final List<TipDTO> dataDTO = await dataSource.fetchData(queryParameters: queryParameters);
      final List<TipEntity> dataEntity = List<TipEntity>.from(
        dataDTO.map(
          (dto) => mapper.convert<TipDTO, TipEntity>(dto)
        )
      );
      return dataEntity;
    } catch (e) {
      return <TipEntity>[];
    }
  }
}