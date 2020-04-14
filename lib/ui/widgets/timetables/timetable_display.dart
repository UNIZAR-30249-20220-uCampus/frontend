import 'package:flutter/material.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/ui/widgets/timetables/slot_display.dart';


class TimetableDisplay extends StatelessWidget {
  final Timetable initialTimetable;
  final Function(Timetable) onTimetableChanged;

  TimetableDisplay(
      {@required this.onTimetableChanged,
      this.initialTimetable});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(initialTimetable.slots.length, (index) {
        return SlotDisplay(
          startingSlot: initialTimetable.slots[index].startingSlotNumber,
          endingSlot: initialTimetable.slots[index].endingSlotNumber,
          weekday: initialTimetable.slots[index].weekday,
        );
      }),
    );
  }
}
