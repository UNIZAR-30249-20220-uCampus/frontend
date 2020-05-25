import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/ui/shared/enums_strings.dart';
import 'package:ucampus/ui/widgets/timetables/timetable_selector.dart';

class ReservationForm extends StatefulWidget {
  final Space space;
  final Function(Timetable, String, bool) onReservation;
  final bool externalUser;

  const ReservationForm({Key key, this.space, this.onReservation, this.externalUser})
      : super(key: key);
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  ReservationFrequency selectedFrecuency = ReservationFrequency.NO;
  Timetable _timetable;

  @override
  void initState() {
    super.initState();
}

  void onTimetableChange(Timetable initialTimetable) {
    setState(() => _timetable = initialTimetable);
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
                                padding: EdgeInsets.only(
                                    top: 10, left: 0, bottom: 0),
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
                                padding: EdgeInsets.only(
                                    top: 20, left: 0, bottom: 10),
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
                                  EdgeInsets.only(top: 5, bottom: 10),
                              child: Container(
                                width: 270.0,
                                height: 35.9,
                                child: Material(
                                  color: Theme.of(context).accentColor,
                                  elevation: 4.0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: Wrap(
                                    spacing: 0.0,
                                    direction: Axis.horizontal,
                                    children: <Widget>[
                                      for (var frequency in ReservationFrequency.values)
                                        Container(
                                          width: frequency ==
                                                    ReservationFrequency.WEEKLY
                                                ? 90
                                                : 60,
                                          child: FlatButton(
                                            color: selectedFrecuency ==
                                                    frequency
                                                ? Theme.of(context).primaryColor
                                                : null,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            child: Text(EnumsStrings
                                                        .reservationFrequency[frequency],
                                                style: TextStyle(
                                                  color: selectedFrecuency ==
                                                          frequency
                                                      ? Theme.of(context)
                                                          .accentColor
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
            )),
        Positioned(
            bottom: 50,
            right: 10,
            left: 10,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 250,
                  child: RoundedLoadingButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Solicitar reserva',
                        style: TextStyle(
                            fontSize: 15, color: Theme.of(context).accentColor),
                      ),
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 2));
                        widget.onReservation(
                            _timetable, widget.space.uuid, widget.externalUser);
                        Navigator.of(context).pop();
                      }),
                ))),
      ],
    );
  }
}
