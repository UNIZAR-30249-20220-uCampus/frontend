import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_selector.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ucampus_lib/core/models/reservation.dart';

class ReservationForm extends StatefulWidget {
  final Space space;
  final Function(Timetable, String, bool, ReservationFrequency, String)
      onReservation;
  final bool externalUser;

  const ReservationForm(
      {Key key, this.space, this.onReservation, this.externalUser})
      : super(key: key);
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  ReservationFrequency selectedFrecuency = ReservationFrequency.NO;
  Timetable _timetable;
  String _deviceid = '';
  String _dateStart = "-- -- ----";
  String _dateFinish = "-- -- ----";

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  void onTimetableChange(Timetable initialTimetable) {
    setState(() => _timetable = initialTimetable);
  }

  Future<void> initDeviceId() async {
    String deviceid;
    deviceid = await DeviceId.getID;

    setState(() {
      _deviceid = deviceid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 10,
            right: 10,
            left: 10,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      title: Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 10, left: 10),
                          child: Text('Reserva de ' + widget.space.uuid,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Theme.of(context).primaryColor,
                              ))),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Horario',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      'Selecciona las franjas horarias en las que deseas reservar el espacio'),
                                ],
                              ),
                            ),
                            TimetableSelector(
                              onTimetableChanged: (timetable) =>
                                  onTimetableChange(timetable),
                              isEnabled: true,
                              initialTimetable: null,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 20, left: 0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Frecuencia',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      'Selecciona la frecuencia con que quieres que se repita la reserva'),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 5, bottom: 10, left: 10),
                              child: Container(
                                  child: DropdownButton<ReservationFrequency>(
                                items: ReservationFrequency.values
                                    .map((ReservationFrequency value) {
                                  return DropdownMenuItem<ReservationFrequency>(
                                    value: value,
                                    child: Text(EnumsStrings
                                        .reservationFrequency[value]),
                                  );
                                }).toList(),
                                onChanged: (kind) =>
                                    setState(() => selectedFrecuency = kind),
                                value: selectedFrecuency,
                              )),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Fechas',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text('Selecciona la fecha de inicio y de fin')
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                    child: Row(children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(right: 15),
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
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
                                            if (selectedFrecuency ==
                                                ReservationFrequency.NO) {
                                              _dateFinish = _dateStart;
                                            }
                                            setState(() {});
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.es);
                                        },
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
                                                              color:
                                                                  Colors.black,
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
                                        color: Colors.white,
                                      )),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
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

                                        if (selectedFrecuency ==
                                            ReservationFrequency.NO) {
                                          _dateStart = _dateFinish;
                                        }
                                        setState(() {});
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.es);
                                    },
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
                                    color: Colors.white,
                                  )
                                ]))),
                          ],
                        ),
                      )),
                ],
              ),
            )),
        Positioned(
            bottom: 30,
            right: 10,
            left: 10,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 250,
                  child: RoundedLoadingButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        widget.externalUser
                            ? 'Siguiente'
                            : 'Solicitar reserva',
                        style: TextStyle(
                            fontSize: 15, color: Theme.of(context).accentColor),
                      ),
                      onPressed: () async {
                        if (widget.externalUser) {
                          var reservation = new Reservation(
                              reservationID: '1',
                              space: widget.space,
                              timeTable: _timetable,
                              frecuency: selectedFrecuency,
                              reservationStatus: ReservationStatus.PENDING,
                              userID: _deviceid);
                          Navigator.pushReplacementNamed(context, "reservation_external",
                              arguments: reservation);
                        } else {
                          widget.onReservation(_timetable, widget.space.uuid,
                              false, selectedFrecuency, _deviceid);
                          Navigator.of(context).pop();
                        }
                      }),
                ))),
      ],
    );
  }
}
