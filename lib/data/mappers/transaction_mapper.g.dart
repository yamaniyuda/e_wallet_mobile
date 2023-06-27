// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
/// Available mappings:
/// - `TransactionDTO` → `TransactionEntity`.
/// - `TransactionEntity` → `TransactionDTO`.
/// {@endtemplate}
class $TransactionMapper implements AutoMapprInterface {
  const $TransactionMapper();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<TransactionDTO>() ||
            sourceTypeOf == _typeOf<TransactionDTO?>()) &&
        (targetTypeOf == _typeOf<TransactionEntity>() ||
            targetTypeOf == _typeOf<TransactionEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<TransactionEntity>() ||
            sourceTypeOf == _typeOf<TransactionEntity?>()) &&
        (targetTypeOf == _typeOf<TransactionDTO>() ||
            targetTypeOf == _typeOf<TransactionDTO?>())) {
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/transaction_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<TransactionDTO>() ||
            sourceTypeOf == _typeOf<TransactionDTO?>()) &&
        (targetTypeOf == _typeOf<TransactionEntity>() ||
            targetTypeOf == _typeOf<TransactionEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TransactionDTO_To_TransactionEntity(
          (model as TransactionDTO?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<TransactionEntity>() ||
            sourceTypeOf == _typeOf<TransactionEntity?>()) &&
        (targetTypeOf == _typeOf<TransactionDTO>() ||
            targetTypeOf == _typeOf<TransactionDTO?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TransactionEntity_To_TransactionDTO(
          (model as TransactionEntity?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TransactionEntity _map_TransactionDTO_To_TransactionEntity(
      TransactionDTO? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionDTO → TransactionEntity failed because TransactionDTO was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionDTO, TransactionEntity> to handle null values during mapping.');
    }
    return TransactionEntity(
      paymentMethod: TransactionMapper.transformPaymentMethod(model.paymentMethod!),
      createdAt: model.createdAt,
      amount: model.amount,
      id: model.id,
      transactionType: TransactionMapper.transformTransactionType(model.transactionType!),
    );
  }

  TransactionDTO _map_TransactionEntity_To_TransactionDTO(
      TransactionEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TransactionEntity → TransactionDTO failed because TransactionEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TransactionEntity, TransactionDTO> to handle null values during mapping.');
    }
    return TransactionDTO(
      id: model.id,
      amount: model.amount,
      createdAt: model.createdAt,
      paymentMethod: null,
      transactionType: null,
    );
  }
}
