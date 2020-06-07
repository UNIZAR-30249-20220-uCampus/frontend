// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space _$SpaceFromJson(Map<String, dynamic> json) {
  final latlon = UTM.fromUtm(
    easting: (json['lng_center'] as double),
    northing: (json['lat_center'] as double),
    zoneNumber: 30,
    zoneLetter: 'T',
  );

  return Space(
    uuid: json['id_espacio'] as String,
    name: json['id_utc'] as String,
    capacity: json['superficie'] as String,
    building: json['id_edificio'] as String,
    isBookable: (json['alquilable'] as int) == 0 ? false : true,
    equipments: (json['equipamientos'] as List)
        ?.map((e) =>
            e == null ? null : Equipment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lat: latlon.lat,
    long: latlon.lon,
    floor: (json['planta'] as int),
  );
}

Map<String, dynamic> _$SpaceToJson(Space instance) => <String, dynamic>{
      'id_espacio': instance.uuid,
      'id_utc': instance.name,
      'kind': _$SpaceKindEnumMap[instance.kind],
      'superficie': instance.capacity,
      'id_edificio': instance.building,
      'alquilable': instance.isBookable,
      'equipamientos': instance.equipments,
      'lat_center': instance.lat,
      'lng_center': instance.long,
      'planta': instance.floor,
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
