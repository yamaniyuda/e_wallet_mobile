import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/transfer_history_dto.dart';
import 'package:e_wallet_mobile/domain/entities/transfer_history_entity.dart';

part 'transfer_history_mapper.g.dart';

@AutoMappr([
  MapType<TransferHistoryDTO, TransferHistoryEntity>(),
  MapType<TransferHistoryEntity, TransferHistoryDTO>()
])
class TransferHistoryMapper extends $TransferHistoryMapper {}