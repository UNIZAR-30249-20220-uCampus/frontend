import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_selector.dart';


class TimetableFilter extends StatefulWidget {
  final bool isEnabled;
  final Function onFilterAdded;
  final Function onFilterRemoved;
  final Timetable initialTimetable;
  final Function(Timetable) onTimetableChange;

  TimetableFilter({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.isEnabled,
    @required this.initialTimetable,
    @required this.onTimetableChange,
  });

  @override
  _TimetableFilterState createState() => _TimetableFilterState();
}

class _TimetableFilterState extends State<TimetableFilter> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Disponibilidad',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: this.widget.isEnabled
                          ? Theme.of(context).primaryColor
                          : Colors.grey),
                ),
                Text(
                    'Selecciona las franjas horarias en las que deseas que esté disponible el espacio que buscas y las fechas de inicio y fin'),
              ],
            ),
          ),
          Switch(
            value: this.widget.isEnabled,
            onChanged: (value) {
              if (value) {
                this.widget.onFilterAdded();
              } else {
                this.widget.onFilterRemoved();
              }
            },
            activeColor: Theme.of(context).primaryColor,
          ),
        ]),
        TimetableSelector(
          onTimetableChanged: (timetable) =>
              this.widget.onTimetableChange(timetable),
          isEnabled: this.widget.isEnabled,
          initialTimetable: this.widget.initialTimetable,
        ),
        Divider(),
      ],
    );
  }
}
