import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/data_plan_dto.dart';
import 'package:e_wallet_mobile/domain/entities/data_plan_entity.dart';

part 'data_plan_mapper.g.dart';
@AutoMappr([
  MapType<DataPlanDTO, DataPlanEntity>(),
  MapType<DataPlanEntity, DataPlanDTO>()
])
class DataPlanMapper extends $DataPlanMapper {}