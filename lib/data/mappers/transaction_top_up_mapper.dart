import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/transaction_top_up_dto.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_top_up_entity.dart';

part 'transaction_top_up_mapper.g.dart';

@AutoMappr([
  MapType<TransactionTopUpDTO, TransactionTopUpEntity>(),
  MapType<TransactionTopUpEntity, TransactionTopUpDTO>(),
])
class TransactionTopUpMapper extends $TransactionTopUpMapper {}