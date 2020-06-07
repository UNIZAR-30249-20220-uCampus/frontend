// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCriteria _$FilterCriteriaFromJson(Map<String, dynamic> json) {
  return FilterCriteria(
    activeCriteria: (json['filtrosActivos'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CriteriaKindEnumMap, e))
        ?.toList(),
    name: json['nombre'] as String,
    /*kinds: (json['kinds'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SpaceKindEnumMap, e))
        ?.toList(),*/
    equipments: (json['equipamientos'] as List)
        ?.map((e) =>
            e == null ? null : Equipment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    capacity: json['aforo'] as int,
    timetable: json['horarioRequest'] == null
        ? null
        : Timetable.fromJson(json['horarioRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FilterCriteriaToJson(FilterCriteria instance) =>
    <String, dynamic>{
      'filtrosActivos': instance.activeCriteria
          ?.map((e) => _$CriteriaKindEnumMap[e])
          ?.toList(),
      'nombre': instance.name,
      /*'kinds': instance.kinds?.map((e) => _$SpaceKindEnumMap[e])?.toList(),*/
      'equipamientos': instance.equipments,
      'aforo': instance.capacity,
      'horarioRequest': instance.timetable,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CriteriaKindEnumMap = {
  CriteriaKind.NAME: 'NOMBRE',
  CriteriaKind.KIND: 'TIPO',
  CriteriaKind.EQUIPMENT: 'EQUIPMENT',
  CriteriaKind.CAPACITY: 'AFORO',
  CriteriaKind.TIMETABLE: 'HORARIO',
};

const _$SpaceKindEnumMap = {
  SpaceKind.WAREHOUSE: 'WAREHOUSE',
  SpaceKind.CLASSROOM: 'CLASSROOM',
  SpaceKind.TOILET: 'TOILET',
  SpaceKind.LIBRARY: 'LIBRARY',
  SpaceKind.CAFETERIA: 'CAFETERIA',
  SpaceKind.OFFICE: 'OFFICE',
  SpaceKind.LABORATORY: 'LABORATORY',
  SpaceKind.CORRIDOR: 'CORRIDOR',
};
