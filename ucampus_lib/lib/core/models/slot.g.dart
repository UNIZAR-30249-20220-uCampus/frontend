// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return Slot(
    weekday: _$enumDecodeNullable(_$WeekdayEnumMap, json['weekday']),
    startingSlotNumber: json['startingSlotNumber'] as int,
    endingSlotNumber: json['endingSlotNumber'] as int,
  );
}

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'weekday': _$WeekdayEnumMap[instance.weekday],
      'startingSlotNumber': instance.startingSlotNumber,
      'endingSlotNumber': instance.endingSlotNumber,
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
  Weekday.MONDAY: 'MONDAY',
  Weekday.TUESDAY: 'TUESDAY',
  Weekday.WEDNESDAY: 'WEDNESDAY',
  Weekday.THURSDAY: 'THURSDAY',
  Weekday.FRIDAY: 'FRIDAY',
  Weekday.SATURDAY: 'SATURDAY',
  Weekday.SUNDAY: 'SUNDAY',
};
