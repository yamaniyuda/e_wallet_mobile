import 'package:e_wallet_mobile/data/data_resource/remote/payment_method_data_source.dart';
import 'package:e_wallet_mobile/data/dto/payment_method_dto.dart';
import 'package:e_wallet_mobile/data/mappers/payment_method_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/payment_method_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/payment_method_repository.dart';

class PaymentMethodRepositoryImpl extends PaymentMethodRepository {
  PaymentMethodRepositoryImpl()
    : super(
    mapper: PaymentMethodMapper(),
    dataSource: PaymentMethodDataSource()
  );

  @override
  Future<List<PaymentMethodEntity>> fetchData() async {
    try {
      final List<PaymentMethodDTO> dataDTO = await dataSource.fetchData();
      final List<PaymentMethodEntity> dataEntity = List<PaymentMethodEntity>.from(
        dataDTO.map((dto) => mapper.convert<PaymentMethodDTO, PaymentMethodEntity>(dto))
      );
      return dataEntity;
    } catch (e) {
      return [];
    }
  }
}