import 'package:e_wallet_mobile/data/data_resource/remote/tip_data_source.dart';
import 'package:e_wallet_mobile/data/mappers/tip_mapper.dart';
import 'package:e_wallet_mobile/domain/entities/tip_entity.dart';
import 'package:e_wallet_mobile/domain/repositories/repository.dart';

abstract class TipRepository extends Repository {
  final TipDataSource dataSource;
  final TipMapper mapper;

  TipRepository(this.dataSource, this.mapper);
  Future<List<TipEntity>> getTips({ Map<String, dynamic>? queryParameters });
}