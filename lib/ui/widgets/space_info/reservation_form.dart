import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ReservationForm extends StatefulWidget {
  final Space space;

  const ReservationForm({Key key, this.space}) : super(key: key);
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  String _dateStart = "-- -- ----";
  String _timeStart = "--:--";
  String _dateFinish = "-- -- ----";
  String _timeFinish = "--:--";

  List<String> frequencies = ['no', 'dia', 'mes', 'año'];
  String selectedFrecuency = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                  child: Text('Reserva de ',
                      style: TextStyle(
                        fontSize: 28,
                      ))),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                        child: Text('Inicio: ',
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 4.0,
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime(2019, 1, 1),
                                maxTime: DateTime(2022, 12, 31),
                                onConfirm: (date) {
                              _dateStart =
                                  '${date.day} - ${date.month} - ${date.year}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.es);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
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
                                Text(
                                  "  Cambiar",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 4.0,
                          onPressed: () {
                            DatePicker.showTimePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true, onConfirm: (time) {
                              _timeStart = '${time.hour} : ${time.minute}';
                              setState(() {});
                            },
                                showSecondsColumn: false,
                                currentTime: DateTime.now(),
                                locale: LocaleType.es);
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.access_time,
                                            size: 15.0,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            " $_timeStart",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "  Cambiar",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 10, bottom: 10),
                        child: Text('Fin: ',
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 4.0,
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime(2019, 1, 1),
                                maxTime: DateTime(2022, 12, 31),
                                onConfirm: (date) {
                              _dateFinish =
                                  '${date.day} - ${date.month} - ${date.year}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.es);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
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
                                Text(
                                  "  Cambiar",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 4.0,
                          onPressed: () {
                            DatePicker.showTimePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true, onConfirm: (time) {
                              _timeFinish = '${time.hour} : ${time.minute}';
                              setState(() {});
                            },
                                showSecondsColumn: false,
                                currentTime: DateTime.now(),
                                locale: LocaleType.es);
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.access_time,
                                            size: 15.0,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            " $_timeFinish",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "  Cambiar",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 10, bottom: 10),
                        child: Text('Frecuencia: ',
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                      child: Container(
                        width: 240.0,
                        height: 35.9,
                        child: Material(
                          color: Theme.of(context).accentColor,
                          elevation: 4.0,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Wrap(
                            spacing: 0.0,
                            direction: Axis.horizontal,
                            children: <Widget>[
                              for (var frequency in frequencies)
                                Container(
                                  width: 60,
                                  child: FlatButton(
                                    color: selectedFrecuency == frequency
                                        ? Theme.of(context).primaryColor
                                        : null,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(frequency,
                                        style: TextStyle(
                                          color: selectedFrecuency == frequency
                                              ? Theme.of(context).accentColor
                                              : Colors.black,
                                        )),
                                    onPressed: () {
                                      selectedFrecuency = frequency;
                                      setState(() {});
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
