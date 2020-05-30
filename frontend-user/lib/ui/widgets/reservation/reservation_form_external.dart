import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_selector.dart';
import 'package:device_id/device_id.dart';

class ReservationFormExternal extends StatefulWidget {
  final Reservation reservation;
  final Function(Timetable, String, bool, ReservationFrequency, String) onReservation;

  const ReservationFormExternal({Key key, this.reservation, this.onReservation})
      : super(key: key);
  @override
  _ReservationFormExternalState createState() =>
      _ReservationFormExternalState();
}

class _ReservationFormExternalState extends State<ReservationFormExternal> {


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
                          child: Text('Reserva de ' + widget.reservation.space.uuid,
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
                                  EdgeInsets.only(top: 20, left: 0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Tarifa',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text('tarifa...'),
                                ],
                              ),
                            )
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
                        'Solicitar reserva',
                        style: TextStyle(
                            fontSize: 15, color: Theme.of(context).accentColor),
                      ),
                      onPressed: () async {
                        widget.onReservation(widget.reservation.timeTable, widget.reservation.space.uuid,
                            true, widget.reservation.frecuency, widget.reservation.userID);
                        Navigator.of(context).pop();
                      }),
                ))),
      ],
    );
  }
}
