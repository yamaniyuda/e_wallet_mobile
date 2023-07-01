import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/data_plan_dto.dart';
import 'package:e_wallet_mobile/data/dto/operator_card_dto.dart';
import 'package:e_wallet_mobile/data/mappers/data_plan_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/data_plan_entity.dart';
import 'package:e_wallet_mobile/domain/entities/operator_card_entity.dart';

part 'operator_card_mapper.g.dart';
@AutoMappr([
  MapType<OperatorCardDTO, OperatorCardEntity>(
      fields: [
        Field('dataPlans', custom: OperatorCardMapper.transformDataPlansToEntity),
      ]
  ),
  MapType<OperatorCardEntity, OperatorCardDTO>(
      fields: [
        Field('dataPlans', custom: OperatorCardMapper.transformDataPlansToDTO),
      ]
  )
])
class OperatorCardMapper extends $OperatorCardMapper {
  static List<DataPlanEntity> transformDataPlansToEntity(List<DataPlanDTO> dataDTO) {
    final DataPlanMapper mapper = DataPlanMapper();
    return List<DataPlanEntity>.from(
      dataDTO.map((dto) => mapper.convert<DataPlanDTO, DataPlanEntity>(dto))
    );
  }

  static List<DataPlanDTO> transformDataPlansToDTO(List<DataPlanEntity> dataEntity) {
    final DataPlanMapper mapper = DataPlanMapper();
    return List<DataPlanDTO>.from(
      dataEntity.map((entity) => mapper.convert<DataPlanEntity, DataPlanDTO>(entity))
    );
  }
}