// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space _$SpaceFromJson(Map<String, dynamic> json) {
  return Space(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    kind: json['kind'] as String,
    capacity: json['capacity'] as int,
    building: json['building'] as String,
    isBookable: json['isBookable'] as bool,
    surface: (json['surface'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SpaceToJson(Space instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'kind': instance.kind,
      'capacity': instance.capacity,
      'building': instance.building,
      'isBookable': instance.isBookable,
      'surface': instance.surface,
    };
