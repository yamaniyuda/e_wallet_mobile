import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:e_wallet_mobile/data/dto/payment_method_dto.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';

part 'payment_method_mapper.g.dart';
@AutoMappr([
  MapType<PaymentMethodDTO, PaymentMethodEntity>(),
  MapType<PaymentMethodEntity, PaymentMethodDTO>()
])
class PaymentMethodMapper extends $PaymentMethodMapper {}