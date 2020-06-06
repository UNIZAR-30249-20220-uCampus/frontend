// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return Equipment(
    equipmentKind: _$enumDecodeNullable(_$EquipmentKindEnumMap, json['tipo']),
    amount: json['cantidad'] as int,
  );
}

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'tipo': _$EquipmentKindEnumMap[instance.equipmentKind],
      'cantidad': instance.amount,
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

const _$EquipmentKindEnumMap = {
  EquipmentKind.CAYON_FIJO: 'CAYON_FIJO',
  EquipmentKind.CANYON_FIJO: 'CANYON_FIJO',
  EquipmentKind.PANTALLA_PROYECTOR: 'PANTALLA_PROYECTOR',
  EquipmentKind.EQUIPO_DE_SONIDO: 'EQUIPO_DE_SONIDO',
  EquipmentKind.TV: 'TV',
  EquipmentKind.VIDEO: 'VIDEO',
  EquipmentKind.DVD: 'DVD',
  EquipmentKind.FOTOCOPIADORAS: 'FOTOCOPIADORAS',
  EquipmentKind.IMPRESORAS: 'IMPRESORAS',
  EquipmentKind.ORDENADORES: 'ORDENADORES',
  EquipmentKind.FAXES: 'FAXES',
  EquipmentKind.TELEFONOS: 'TELEFONOS',
  EquipmentKind.PIZARRA: 'PIZARRA',
  EquipmentKind.NMRO_EXTINTORES_POLVO: 'NMRO_EXTINTORES_POLVO',
  EquipmentKind.NMRO_EXTINTORES_CO2: 'NMRO_EXTINTORES_CO2',
  EquipmentKind.NMRO_PLAZAS: 'NMRO_PLAZAS',
};
