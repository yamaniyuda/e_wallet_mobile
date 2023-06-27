// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:e_wallet_mobile/data/mappers/tip_mapper.dart}
/// Available mappings:
/// - `TipDTO` → `TipEntity`.
/// - `TipEntity` → `TipDTO`.
/// {@endtemplate}
class $TipMapper implements AutoMapprInterface {
  const $TipMapper();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<TipDTO>() ||
            sourceTypeOf == _typeOf<TipDTO?>()) &&
        (targetTypeOf == _typeOf<TipEntity>() ||
            targetTypeOf == _typeOf<TipEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<TipEntity>() ||
            sourceTypeOf == _typeOf<TipEntity?>()) &&
        (targetTypeOf == _typeOf<TipDTO>() ||
            targetTypeOf == _typeOf<TipDTO?>())) {
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
  /// {@macro package:e_wallet_mobile/data/mappers/tip_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<TipDTO>() ||
            sourceTypeOf == _typeOf<TipDTO?>()) &&
        (targetTypeOf == _typeOf<TipEntity>() ||
            targetTypeOf == _typeOf<TipEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TipDTO_To_TipEntity((model as TipDTO?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<TipEntity>() ||
            sourceTypeOf == _typeOf<TipEntity?>()) &&
        (targetTypeOf == _typeOf<TipDTO>() ||
            targetTypeOf == _typeOf<TipDTO?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map_TipEntity_To_TipDTO((model as TipEntity?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TipEntity _map_TipDTO_To_TipEntity(TipDTO? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TipDTO → TipEntity failed because TipDTO was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TipDTO, TipEntity> to handle null values during mapping.');
    }
    return TipEntity(
      id: model.id,
      thumbnail: model.thumbnail,
      title: model.title,
      url: model.url,
    );
  }

  TipDTO _map_TipEntity_To_TipDTO(TipEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping TipEntity → TipDTO failed because TipEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<TipEntity, TipDTO> to handle null values during mapping.');
    }
    return TipDTO(
      id: model.id,
      thumbnail: model.thumbnail,
      title: model.title,
      url: model.url,
    );
  }
}
