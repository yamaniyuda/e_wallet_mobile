import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/payment_method_dto.dart';
import 'package:e_wallet_mobile/data/dto/transaction_dto.dart';
import 'package:e_wallet_mobile/data/dto/transaction_type_dto.dart';
import 'package:e_wallet_mobile/data/mappers/payment_method_mapper.dart';
import 'package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_entity.dart';
import 'package:e_wallet_mobile/domain/entities/transaction_type_entity.dart';

part 'transaction_mapper.g.dart';

@AutoMappr([
  MapType<TransactionDTO, TransactionEntity>(
    fields: [
      Field('transactionType', custom: TransactionMapper.transformTransactionType),
      Field('paymentMethod', custom: TransactionMapper.transformPaymentMethod)
    ]
  ),
  MapType<TransactionEntity, TransactionDTO>()
])
class TransactionMapper extends $TransactionMapper {
  static TransactionTypeEntity transformTransactionType(TransactionTypeDTO dataDTO) {
    return TransactionTypeMapper().convert<TransactionTypeDTO, TransactionTypeEntity>(dataDTO);
  }

  static PaymentMethodEntity transformPaymentMethod(PaymentMethodDTO dataDTO) {
    return PaymentMethodMapper().convert<PaymentMethodDTO, PaymentMethodEntity>(dataDTO);
  }
}