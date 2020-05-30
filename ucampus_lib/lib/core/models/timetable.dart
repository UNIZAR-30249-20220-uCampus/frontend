import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ucampus_lib/core/models/slot.dart';

part 'timetable.g.dart';

@JsonSerializable()
class Timetable {
  List<Slot> slots;
  DateTime startDate;
  DateTime endDate;

  Timetable({this.startDate, this.endDate}) {
    slots = [];
  }

  void addSlot(Weekday weekday) {
    slots.add(Slot(
        weekday: weekday,
        startingSlotNumber: 10 * 2,
        endingSlotNumber: 12 * 2));
  }

  void addDates(DateTime _startDate, DateTime _endDate) {
    startDate = _startDate;
    endDate = _endDate;
  }

  void updateSlot(int index, int start, int end) {
    slots[index] =
        slots[index].copy(startingSlotNumber: start, endingSlotNumber: end);
  }

  void deleteSlot(int index) {
    slots.removeAt(index);
  }

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode => this.slots.hashCode;

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
  Map<String, dynamic> toJson() => _$TimetableToJson(this);

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is Timetable &&
            listEquals(this.slots, other.slots) &&
            this.startDate == other.startDate &&
            this.endDate == other.endDate);
  }

  static Timetable randomTimetable({int labNumber}) {
    final _random = Random();
    var timetable = Timetable(startDate: DateTime.now(), endDate: DateTime.now());
    timetable.addSlot(Weekday.values[_random.nextInt(Weekday.values.length)]);
    timetable.addSlot(Weekday.values[_random.nextInt(Weekday.values.length)]);
    return timetable;
  }
}
