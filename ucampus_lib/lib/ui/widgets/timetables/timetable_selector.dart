import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucampus_lib/core/models/slot.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/date_selector.dart';
import 'package:ucampus_lib/ui/widgets/timetables/slot_selector.dart';

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
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  TextEditingController _controller = new TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    _timetable = Timetable(startDate: startDate, endDate: endDate, frecuency: 1);
    if (this.widget.initialTimetable != null) {
      _timetable = this.widget.initialTimetable;
      _controller = new TextEditingController(
          text: _timetable.frecuency != null
              ? _timetable.frecuency.toString()
              : '1');
      startDate = _timetable.startDate ?? startDate;
      endDate = _timetable.endDate ?? endDate;
    }
    _weekday = Weekday.MONDAY;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_timetable.slots.length + 1, (index) {
        if (index == _timetable.slots.length) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.add,
                    color: this.widget.isEnabled
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    'Añadir horario el ',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: DropdownButton<Weekday>(
                    items: Weekday.values.map((Weekday value) {
                      return DropdownMenuItem<Weekday>(
                        value: value,
                        child: Text(EnumsStrings.weekday[value]),
                      );
                    }).toList(),
                    onChanged: (kind) => setState(() => _weekday = kind),
                    value: _weekday,
                  ),
                  onTap: () {
                    if (this.widget.isEnabled) {
                      setState(() => _timetable.addSlot(_weekday));
                      this.widget.onTimetableChanged(_timetable);
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.date_range,
                    color: this.widget.isEnabled
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    'Fechas de inicio y de fin ',
                    style: TextStyle(fontSize: 17),
                  ),
                  isThreeLine: false,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DateSelector(
                          currentTime: startDate,
                          isEnabled: widget.isEnabled,
                          onDateSelected: (date) {
                            setState(
                              () {
                                startDate = date;
                                _timetable.addDates(startDate, endDate);
                              },
                            );
                            this.widget.onTimetableChanged(_timetable);
                          },
                        ),
                        Container(width: 20),
                        DateSelector(
                          currentTime: endDate,
                          isEnabled: widget.isEnabled,
                          onDateSelected: (date) {
                            setState(() {
                              endDate = date;
                              _timetable.addDates(startDate, endDate);
                            });
                            this.widget.onTimetableChanged(_timetable);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 10),
                ListTile(
                  leading: Icon(
                    Icons.replay,
                    color: this.widget.isEnabled
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    'Frecuencia',
                    style: TextStyle(fontSize: 17),
                  ),
                  isThreeLine: true,
                  subtitle: Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: TextField(
                      enabled: this.widget.isEnabled,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      onChanged: (text) {
                        setState(() {
                          _timetable.setFrecuency(int.parse(text));
                        });
                        this.widget.onTimetableChanged(_timetable);
                      },
                      decoration: InputDecoration(
                        labelText: 'Cada X semanas',
                      ),
                    ),
                  ),
                ),
              ]);
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
