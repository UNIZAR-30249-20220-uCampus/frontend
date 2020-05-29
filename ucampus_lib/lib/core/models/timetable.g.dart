// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return Timetable()
    ..slots = (json['slots'] as List)
        ?.map(
            (e) => e == null ? null : Slot.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'slots': instance.slots,
    };
