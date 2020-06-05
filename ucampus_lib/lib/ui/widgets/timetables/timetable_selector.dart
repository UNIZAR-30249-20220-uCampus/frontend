import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/slot.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/slot_selector.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  DateTime startDate;
  DateTime endDate;
  String _dateStart = "-- -- ----";
  String _dateFinish = "-- -- ----";
  TextEditingController _controller = new TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    if (this.widget.initialTimetable == null) {
      _timetable = Timetable();
    } else {
      _timetable = this.widget.initialTimetable;
      _controller = new TextEditingController(text: _timetable.frecuency != null ?_timetable.frecuency.toString(): '0');
      startDate = _timetable.startDate;
      _dateStart = startDate != null ? '${startDate.day} - ${startDate.month} - ${startDate.year}': "-- -- ----";
      endDate = _timetable.endDate;
      _dateFinish = endDate!= null ? '${endDate.day} - ${endDate.month} - ${endDate.year}': "-- -- ----";
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
                Row(
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
                            Text(
                              ' Añadir franja horaria el ',
                              style: TextStyle(fontSize: 17),
                            )
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
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 8, bottom: 10),
                    child: Row(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: this.widget.isEnabled
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                              ),
                              Text(
                                ' Fechas de inicio y de fin ',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ],
                      ),
                    ])),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Container(
                        child: Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: RaisedButton(
                            color: Colors.white,
                            disabledColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            elevation: 0.0,
                            onPressed: this.widget.isEnabled
                                ? () {
                                    DatePicker.showDatePicker(context,
                                        theme: DatePickerTheme(
                                          containerHeight: 210.0,
                                        ),
                                        showTitleActions: true,
                                        minTime: DateTime(2019, 1, 1),
                                        maxTime: DateTime(2022, 12, 31),
                                        onConfirm: (date) {
                                      setState(() {
                                        _dateStart =
                                            '${date.day} - ${date.month} - ${date.year}';
                                        startDate = date;
                                        _timetable.addDates(startDate, endDate);
                                      });
                                      this
                                          .widget
                                          .onTimetableChanged(_timetable);
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.es);
                                  }
                                : null,
                            child: Container(
                              alignment: Alignment.center,
                              height: 30.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.date_range,
                                              size: 15.0,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              " $_dateStart",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      RaisedButton(
                        color: Colors.white,
                        disabledColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 0.0,
                        onPressed: this.widget.isEnabled
                            ? () {
                                DatePicker.showDatePicker(context,
                                    theme: DatePickerTheme(
                                      containerHeight: 210.0,
                                    ),
                                    showTitleActions: true,
                                    minTime: DateTime(2019, 1, 1),
                                    maxTime: DateTime(2022, 12, 31),
                                    onConfirm: (date) {
                                  setState(() {
                                    _dateFinish =
                                        '${date.day} - ${date.month} - ${date.year}';
                                    endDate = date;
                                    _timetable.addDates(startDate, endDate);
                                  });
                                  this.widget.onTimetableChanged(_timetable);
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.es);
                              }
                            : null,
                        child: Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          " $_dateFinish",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ]))),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 8, bottom: 0),
                    child: Row(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.replay,
                                color: this.widget.isEnabled
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                              ),
                              Text(
                                ' Frecuencia ',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ],
                      ),
                    ])),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 40),
                  child: Container(
                    width: 200,
                      child: TextField(
                        enabled: this.widget.isEnabled,   
                    controller: _controller,    
                    onChanged: (texto) {
                      setState(() {
                        _timetable.setFrecuency(int.parse(texto));
                      });
                      this.widget.onTimetableChanged(_timetable);
                    },
                    decoration: InputDecoration(
                      labelText: 'Cada X semanas',
                    ),
                  )),
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
