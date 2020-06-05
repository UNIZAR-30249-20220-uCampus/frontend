// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return Timetable(
    startDate: json['fechaInicio'] == null
        ? null
        : DateFormat("MMM d, yyyy, hh:mm:ss aaa").parse(json['fechaInicio'] as String),
    endDate: json['fechaFin'] == null
        ? null
        : DateFormat("MMM d, yyyy, hh:mm:ss aaa").parse(json['fechaFin'] as String),
    frecuency: json['frecuencia'] as int,
  )..slots = (json['conjuntoDiaSlots'] as List)
      ?.map((e) => e == null ? null : Slot.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'conjuntoDiaSlots': instance.slots,
      'fechaInicio': instance.startDate?.toIso8601String(),
      'fechaFin': instance.endDate?.toIso8601String(),
      'frecuencia': instance.frecuency,
    };
