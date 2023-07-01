// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_plan_mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
/// Available mappings:
/// - `DataPlanDTO` → `DataPlanEntity`.
/// - `DataPlanEntity` → `DataPlanDTO`.
/// {@endtemplate}
class $DataPlanMapper implements AutoMapprInterface {
  const $DataPlanMapper();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<DataPlanDTO>() ||
            sourceTypeOf == _typeOf<DataPlanDTO?>()) &&
        (targetTypeOf == _typeOf<DataPlanEntity>() ||
            targetTypeOf == _typeOf<DataPlanEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<DataPlanEntity>() ||
            sourceTypeOf == _typeOf<DataPlanEntity?>()) &&
        (targetTypeOf == _typeOf<DataPlanDTO>() ||
            targetTypeOf == _typeOf<DataPlanDTO?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _modules) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
      Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>((item) => _convert(item, canReturnNull: true));
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:e_wallet_mobile/data/mappers/data_plan_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<DataPlanDTO>() ||
            sourceTypeOf == _typeOf<DataPlanDTO?>()) &&
        (targetTypeOf == _typeOf<DataPlanEntity>() ||
            targetTypeOf == _typeOf<DataPlanEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_DataPlanDTO_To_DataPlanEntity((model as DataPlanDTO?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<DataPlanEntity>() ||
            sourceTypeOf == _typeOf<DataPlanEntity?>()) &&
        (targetTypeOf == _typeOf<DataPlanDTO>() ||
            targetTypeOf == _typeOf<DataPlanDTO?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_DataPlanEntity_To_DataPlanDTO((model as DataPlanEntity?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  DataPlanEntity _map_DataPlanDTO_To_DataPlanEntity(DataPlanDTO? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping DataPlanDTO → DataPlanEntity failed because DataPlanDTO was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<DataPlanDTO, DataPlanEntity> to handle null values during mapping.');
    }
    return DataPlanEntity(
      id: model.id,
      price: model.price,
      name: model.name,
      operatorCardId: model.operatorCardId,
    );
  }

  DataPlanDTO _map_DataPlanEntity_To_DataPlanDTO(DataPlanEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping DataPlanEntity → DataPlanDTO failed because DataPlanEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<DataPlanEntity, DataPlanDTO> to handle null values during mapping.');
    }
    return DataPlanDTO(
      id: model.id,
      name: model.name,
      operatorCardId: model.operatorCardId,
      price: model.price,
    );
  }
}
