import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/tip_dto.dart';
import 'package:e_wallet_mobile/domain/entities/tip_entity.dart';

part 'tip_mapper.g.dart';

@AutoMappr([
  MapType<TipDTO, TipEntity>(),
  MapType<TipEntity, TipDTO>()
])
class TipMapper extends $TipMapper {}