// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space _$SpaceFromJson(Map<String, dynamic> json) {
  return Space(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    kind: _$enumDecodeNullable(_$SpaceKindEnumMap, json['kind']),
    capacity: json['capacity'] as int,
    building: json['building'] as String,
    isBookable: json['isBookable'] as bool,
    surface: (json['surface'] as num)?.toDouble(),
    equipments: (json['equipments'] as List)
        ?.map((e) =>
            e == null ? null : Equipment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SpaceToJson(Space instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'kind': _$SpaceKindEnumMap[instance.kind],
      'capacity': instance.capacity,
      'building': instance.building,
      'isBookable': instance.isBookable,
      'surface': instance.surface,
      'equipments': instance.equipments,
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
