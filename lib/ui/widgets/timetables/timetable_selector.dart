import 'package:flutter/material.dart';
import 'package:ucampus/core/models/slot.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/ui/shared/enums_strings.dart';
import 'package:ucampus/ui/widgets/timetables/slot_selector.dart';

class TimetableSelector extends StatefulWidget {
  final bool isEnabled;
  final Timetable initialTimetable;
  final Function(Timetable) onTimetableChanged;

  TimetableSelector(
      {@required this.onTimetableChanged,
      @required this.isEnabled,
      this.initialTimetable});

  @override
  _TimetableSelectorState createState() => _TimetableSelectorState();
}

Timetable _timetable;
Weekday _weekday;

class _TimetableSelectorState extends State<TimetableSelector> {
  @override
  void initState() {
    super.initState();
    if (this.widget.initialTimetable == null) {
      _timetable = Timetable();
    } else {
      _timetable = this.widget.initialTimetable;
    }

    _weekday = Weekday.MONDAY;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_timetable.slots.length + 1, (index) {
        if (index == _timetable.slots.length) {
          return Row(
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: this.widget.isEnabled
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      Text(' Añadir franja horaria el ', style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                onTap: () {
                  if (this.widget.isEnabled) {
                    setState(() => _timetable.addSlot(_weekday));
                    this.widget.onTimetableChanged(_timetable);
                  }
                },
              ),
              DropdownButton<Weekday>(
                items: Weekday.values.map((Weekday value) {
                  return DropdownMenuItem<Weekday>(
                    value: value,
                    child: Text(EnumsStrings.weekday[value]),
                  );
                }).toList(),
                onChanged: (kind) => setState(() => _weekday = kind),
                value: _weekday,
              )
            ],
          );
        }
        return SlotSelector(
          isEnabled: widget.isEnabled,
          onChanged: (start, end) {
            setState(() => _timetable.updateSlot(index, start, end));
            this.widget.onTimetableChanged(_timetable);
          },
          onDeleted: () {
            setState(() => _timetable.deleteSlot(index));
            this.widget.onTimetableChanged(_timetable);
          },
          startingSlot: _timetable.slots[index].startingSlotNumber,
          endingSlot: _timetable.slots[index].endingSlotNumber,
          weekday: _timetable.slots[index].weekday,
        );
      }),
    );
  }
}
