// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_type_mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
/// Available mappings:
/// - `TransactionTypeDTO` → `TransactionTypeEntity`.
/// - `TransactionTypeEntity` → `TransactionTypeDTO`.
/// {@endtemplate}
class $TransactionTypeMapper implements AutoMapprInterface {
  const $TransactionTypeMapper();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<TransactionTypeDTO>() ||
            sourceTypeOf == _typeOf<TransactionTypeDTO?>()) &&
        (targetTypeOf == _typeOf<TransactionTypeEntity>() ||
            targetTypeOf == _typeOf<TransactionTypeEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<TransactionTypeEntity>() ||
            sourceTypeOf == _typeOf<TransactionTypeEntity?>()) &&
        (targetTypeOf == _typeOf<TransactionTypeDTO>() ||
            targetTypeOf == _typeOf<TransactionTypeDTO?>())) {
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_type_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<TransactionTypeDTO>() ||
            sourceTypeOf == _typeOf<TransactionTypeDTO?>()) &&
        (targetTypeOf == _typeOf<TransactionTypeEntity>() ||
            targetTypeOf == _typeOf<TransactionTypeEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TransactionTypeDTO_To_TransactionTypeEntity(
          (model as TransactionTypeDTO?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<TransactionTypeEntity>() ||
            sourceTypeOf == _typeOf<TransactionTypeEntity?>()) &&
        (targetTypeOf == _typeOf<TransactionTypeDTO>() ||
            targetTypeOf == _typeOf<TransactionTypeDTO?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TransactionTypeEntity_To_TransactionTypeDTO(
          (model as TransactionTypeEntity?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TransactionTypeEntity _map_TransactionTypeDTO_To_TransactionTypeEntity(
      TransactionTypeDTO? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionTypeDTO → TransactionTypeEntity failed because TransactionTypeDTO was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionTypeDTO, TransactionTypeEntity> to handle null values during mapping.');
    }
    return TransactionTypeEntity(
      id: model.id,
      name: model.name,
      thumbnail: model.thumbnail,
      action: model.action,
      code: model.code,
    );
  }

  TransactionTypeDTO _map_TransactionTypeEntity_To_TransactionTypeDTO(
      TransactionTypeEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionTypeEntity → TransactionTypeDTO failed because TransactionTypeEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionTypeEntity, TransactionTypeDTO> to handle null values during mapping.');
    }
    return TransactionTypeDTO(
      code: model.code,
      thumbnail: model.thumbnail,
      name: model.name,
      id: model.id,
      action: model.action,
    );
  }
}
