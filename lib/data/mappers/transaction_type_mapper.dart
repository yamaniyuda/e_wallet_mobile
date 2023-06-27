import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/transaction_type_dto.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_type_entity.dart';

part 'transaction_type_mapper.g.dart';

@AutoMappr([
  MapType<TransactionTypeDTO, TransactionTypeEntity>(),
  MapType<TransactionTypeEntity, TransactionTypeDTO>()
])
class TransactionTypeMapper extends $TransactionTypeMapper {}