import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/services/api_service.dart';
import '../../../locator.dart';

class PendingReservationsCard extends StatelessWidget {
  final Space space;

  PendingReservationsCard({
    @required this.space,
  });

  Future<List<Reservation>> getUpendingReservations(String spaceID) async {
    ApiService apiService = locator<ApiService>();
    return await apiService.getSpaceReservation(spaceID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FutureBuilder<List<Reservation>>(
              future: getUpendingReservations(space.uuid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      child: Column(children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 30, bottom: 10, left: 5),
                                child: Text('Reservas pendientes ',
                                    style: TextStyle(
                                      fontSize: 24,
                                    ))))),
                    for (var reservation in snapshot.data)
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                subtitle: Padding(
                              padding: EdgeInsets.only(bottom: 20, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 15),
                                      child: Row(children: <Widget>[
                                        Text("Inicio: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        Text(
                                            reservation.inicio.day.toString() +
                                                '-' +
                                                reservation.inicio.month
                                                    .toString() +
                                                '-' +
                                                reservation.inicio.year
                                                    .toString() +
                                                '   ' +
                                                reservation.inicio.hour
                                                    .toString() +
                                                ':' +
                                                reservation.inicio.minute
                                                    .toString() +
                                                ' ',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))
                                      ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Row(children: <Widget>[
                                        Text("Fin: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        Text(
                                            reservation.fin.day.toString() +
                                                '-' +
                                                reservation.fin.month
                                                    .toString() +
                                                '-' +
                                                reservation.fin.year
                                                    .toString() +
                                                '   ' +
                                                reservation.fin.hour
                                                    .toString() +
                                                ':' +
                                                reservation.fin.minute
                                                    .toString() +
                                                ' ',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))
                                      ])),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Row(children: <Widget>[
                                        Text('Frecuencia: ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                        Text(reservation.frecuencia,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))
                                      ])),
                                ],
                              ),
                            )),
                          ],
                        ),
                      )
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
