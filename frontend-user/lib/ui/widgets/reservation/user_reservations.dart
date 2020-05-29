import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/shared/string_utils.dart';

class UserReservations extends StatefulWidget {
  final List<ReservationStatus> reservationFilterCriteria;
  final Future<List<Reservation>> userReservations;

  UserReservations({
    @required this.reservationFilterCriteria,
    @required this.userReservations,
  });

  @override
  _UserReservationsState createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservations> {
  List<ReservationStatus> _selectedFilters;
  Future<List<Reservation>> _userReservations;

  @override
  void initState() {
    super.initState();
    _selectedFilters = widget.reservationFilterCriteria;
    _userReservations = widget.userReservations;
  }

  Widget reservationStatus(ReservationStatus status) {
    Color color = Colors.grey;
    String label = 'default';

    switch (status) {
      case ReservationStatus.ACCEPTED:
        color = Colors.greenAccent;
        label = 'Aceptada';
        break;
      case ReservationStatus.REJECTED:
        color = Colors.redAccent;
        label = 'Rechazada';
        break;
      case ReservationStatus.PENDING:
        color = Colors.grey;
        label = 'Pendiente';
        break;
      case ReservationStatus.PENDING_PAYMENT:
        color = Colors.amberAccent;
        label = 'Pendiente de pago';
        break;
    }
    return Chip(
      backgroundColor: color,
      label: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FutureBuilder<List<Reservation>>(
              future: _userReservations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      child: Column(children: <Widget>[
                    for (var reservation in (_selectedFilters.isEmpty
                        ? snapshot.data
                        : snapshot.data.where((i) =>
                            _selectedFilters.contains(i.reservationStatus))))
                      Card(
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                if (reservation.reservationStatus ==
                                        ReservationStatus.PENDING ||
                                    reservation.reservationStatus ==
                                        ReservationStatus.PENDING_PAYMENT) {
                                  Navigator.pushNamed(
                                      context, "reservation_info_cancel",
                                      arguments: reservation);
                                } else {
                                  Navigator.pushNamed(
                                      context, "reservation_info",
                                      arguments: reservation);
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                      title: Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, bottom: 0, left: 10),
                                          child: Text(reservation.space.uuid,
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ))),
                                      subtitle: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 0,
                                          left: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    top: 15,
                                                    bottom: 5),
                                                child: Row(children: <Widget>[
                                                  Text("Horario: ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black)),
                                                ])),
                                            for (var slot
                                                in reservation.timeTable.slots)
                                              Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  bottom: 5),
                                                          child: Text(
                                                              EnumsStrings.weekday[slot
                                                                      .weekday] +
                                                                  '  ' +
                                                                  StringUtils
                                                                      .slotNumberToTimeString(slot
                                                                          .startingSlotNumber) +
                                                                  '-' +
                                                                  StringUtils
                                                                      .slotNumberToTimeString(
                                                                          slot.endingSlotNumber),
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ))),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5, left: 10),
                                                child: Row(children: <Widget>[
                                                  Text('Frecuencia: ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black)),
                                                  Text(
                                                      EnumsStrings
                                                              .reservationFrequency[
                                                          reservation
                                                              .frecuency],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ))
                                                ])),
                                          ],
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 20, bottom: 3),
                                        child: reservationStatus(
                                            reservation.reservationStatus)),
                                  )
                                ],
                              )))
                  ]));
                } else if (snapshot.hasError) {
                  return Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                      child: Text("${snapshot.error}",
                          style: Theme.of(context).textTheme.headline));
                } else {
                  return Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                      ));
                }
              }),
        ],
      ),
    );
  }
}
