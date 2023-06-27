import 'package:e_wallet_mobile/data/data_resource/remote/payment_method_data_source.dart';
import 'package:e_wallet_mobile/data/mappers/payment_method_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class PaymentMethodRepository extends Repository {
  final PaymentMethodDataSource dataSource;
  final PaymentMethodMapper mapper;

  PaymentMethodRepository({ required this.dataSource, required this.mapper });
  Future<List<PaymentMethodEntity>> fetchData();
}