import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_display.dart';

class ReservationInfoCard extends StatelessWidget {
  final Reservation reservation;
  final bool canCancel;

  ReservationInfoCard({
    @required this.reservation,
    @required this.canCancel,
  });

  @override
  Widget build(BuildContext context) {
    void onTimetableChange(Timetable initialTimetable) {}
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
                          child: Text('Reserva de ' + reservation.space.uuid,
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
                                      'Franjas horarias en las que se ha reservado el espacio'),
                                ],
                              ),
                            ),
                            TimetableDisplay(
                              onTimetableChanged: (timetable) =>
                                  onTimetableChange(timetable),
                              initialTimetable: reservation.timeTable,
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
                                      'Frecuencia de repetición de la reserva'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
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
                                      for (var frequency
                                          in ReservationFrequency.values)
                                        Container(
                                          width: frequency ==
                                                  ReservationFrequency.WEEKLY
                                              ? 90
                                              : 60,
                                          child: FlatButton(
                                            disabledColor: reservation
                                                        .frecuency ==
                                                    frequency
                                                ? Theme.of(context).primaryColor
                                                : Colors.white,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            child: Text(
                                                EnumsStrings
                                                        .reservationFrequency[
                                                    frequency],
                                                style: TextStyle(
                                                  color: reservation
                                                              .frecuency ==
                                                          frequency
                                                      ? Theme.of(context)
                                                          .accentColor
                                                      : Colors.black,
                                                )),
                                            onPressed: null,
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
        canCancel
            ? Positioned(
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
                            'Cancelar reserva',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor),
                          ),
                          onPressed: () async {}),
                    )))
            : Container(),
      ],
    );
  }
}
