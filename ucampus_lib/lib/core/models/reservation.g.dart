// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return Reservation(
    reservationID: json['id'] as int,
    space: json['espacio'] as String,
    timeTable: json['horario'] == null
        ? null
        : Timetable.fromJson(json['horario'] as Map<String, dynamic>),
    reservationStatus:
        _$enumDecodeNullable(_$ReservationStatusEnumMap, json['estado']),
    userID: json['usuario'] as String,
  );
}

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'id': instance.reservationID,
      'usuario': instance.userID,
      'espacio': instance.space,
      'horario': instance.timeTable,
      'estado': _$ReservationStatusEnumMap[instance.reservationStatus],
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

const _$ReservationStatusEnumMap = {
  ReservationStatus.PENDIENTE: 'PENDIENTE',
  ReservationStatus.PENDIENTEPAGO: 'PENDIENTEPAGO',
  ReservationStatus.ACEPTADA: 'ACEPTADA',
  ReservationStatus.CANCELADA: 'CANCELADA',
};
