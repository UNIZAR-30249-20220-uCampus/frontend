// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return Slot(
    weekday: _$enumDecodeNullable(_$WeekdayEnumMap, json['diaSemana']),
    startingSlotNumber: json['slotInicio'] as int,
    endingSlotNumber: json['slotFinal'] as int,
  );
}

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'diaSemana': _$WeekdayEnumMap[instance.weekday],
      'slotInicio': instance.startingSlotNumber,
      'slotFinal': instance.endingSlotNumber,
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

const _$WeekdayEnumMap = {
  Weekday.MONDAY: 1,
  Weekday.TUESDAY: 2,
  Weekday.WEDNESDAY: 3,
  Weekday.THURSDAY: 4,
  Weekday.FRIDAY: 5,
  Weekday.SATURDAY: 6,
  Weekday.SUNDAY: 7,
};
