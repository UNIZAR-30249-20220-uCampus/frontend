// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return Equipment(
    equipmentKind:
        _$enumDecodeNullable(_$EqipmentKindEnumMap, json['equipmentKind']),
    amount: json['amount'] as int,
  );
}

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'equipmentKind': _$EqipmentKindEnumMap[instance.equipmentKind],
      'amount': instance.amount,
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

const _$EqipmentKindEnumMap = {
  EqipmentKind.TABLE: 'TABLE',
  EqipmentKind.CHAIR: 'CHAIR',
  EqipmentKind.COMPUTER: 'COMPUTER',
  EqipmentKind.PROJECTOR: 'PROJECTOR',
  EqipmentKind.BOARD: 'BOARD',
};
