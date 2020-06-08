import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateSelector extends StatelessWidget {
  final DateTime currentTime;
  final bool isEnabled;
  final Function(DateTime) onDateSelected;

  DateSelector({
    @required this.currentTime,
    @required this.isEnabled,
    @required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: this.isEnabled ? Theme.of(context).primaryColor : Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      onPressed: () {
        if (this.isEnabled) {
          DatePicker.showDatePicker(
            context,
            theme: DatePickerTheme(
              containerHeight: 210.0,
            ),
            showTitleActions: true,
            minTime: DateTime(2019, 1, 1),
            maxTime: DateTime(2022, 12, 31),
            onConfirm: (date) {
              this.onDateSelected(date);
            },
            currentTime: currentTime,
            locale: LocaleType.es,
          );
        }
      },
      child: DateDisplay(isEnabled: isEnabled, currentTime: currentTime),
    );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    Key key,
    @required this.isEnabled,
    @required this.currentTime,
  });

  final bool isEnabled;
  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    final DateFormat _formatter = DateFormat('dd / MM / yyyy');
    return Container(
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
                      color: this.isEnabled ? Colors.white : Colors.black,
                    ),
                    Container(width: 4),
                    Text(
                      _formatter.format(currentTime),
                      style: TextStyle(
                          color: this.isEnabled ? Colors.white : Colors.black,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
