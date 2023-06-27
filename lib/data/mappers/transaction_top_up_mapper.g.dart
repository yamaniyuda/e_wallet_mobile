// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_top_up_mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
/// Available mappings:
/// - `TransactionTopUpDTO` → `TransactionTopUpEntity`.
/// - `TransactionTopUpEntity` → `TransactionTopUpDTO`.
/// {@endtemplate}
class $TransactionTopUpMapper implements AutoMapprInterface {
  const $TransactionTopUpMapper();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<TransactionTopUpDTO>() ||
            sourceTypeOf == _typeOf<TransactionTopUpDTO?>()) &&
        (targetTypeOf == _typeOf<TransactionTopUpEntity>() ||
            targetTypeOf == _typeOf<TransactionTopUpEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<TransactionTopUpEntity>() ||
            sourceTypeOf == _typeOf<TransactionTopUpEntity?>()) &&
        (targetTypeOf == _typeOf<TransactionTopUpDTO>() ||
            targetTypeOf == _typeOf<TransactionTopUpDTO?>())) {
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_top_up_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<TransactionTopUpDTO>() ||
            sourceTypeOf == _typeOf<TransactionTopUpDTO?>()) &&
        (targetTypeOf == _typeOf<TransactionTopUpEntity>() ||
            targetTypeOf == _typeOf<TransactionTopUpEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TransactionTopUpDTO_To_TransactionTopUpEntity(
          (model as TransactionTopUpDTO?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<TransactionTopUpEntity>() ||
            sourceTypeOf == _typeOf<TransactionTopUpEntity?>()) &&
        (targetTypeOf == _typeOf<TransactionTopUpDTO>() ||
            targetTypeOf == _typeOf<TransactionTopUpDTO?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TransactionTopUpEntity_To_TransactionTopUpDTO(
          (model as TransactionTopUpEntity?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TransactionTopUpEntity _map_TransactionTopUpDTO_To_TransactionTopUpEntity(
      TransactionTopUpDTO? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionTopUpDTO → TransactionTopUpEntity failed because TransactionTopUpDTO was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionTopUpDTO, TransactionTopUpEntity> to handle null values during mapping.');
    }
    return TransactionTopUpEntity(
      token: model.token,
      redirectUrl: model.redirectUrl,
    );
  }

  TransactionTopUpDTO _map_TransactionTopUpEntity_To_TransactionTopUpDTO(
      TransactionTopUpEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionTopUpEntity → TransactionTopUpDTO failed because TransactionTopUpEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionTopUpEntity, TransactionTopUpDTO> to handle null values during mapping.');
    }
    return TransactionTopUpDTO(
      token: model.token,
      redirectUrl: model.redirectUrl,
    );
  }
}
