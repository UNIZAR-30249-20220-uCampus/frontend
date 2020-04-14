import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:ucampus/ui/shared/enums_strings.dart';
import 'package:ucampus/ui/shared/string_utils.dart';
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
                    for (var reservation in snapshot.data)
                      Card(
                          child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.pushNamed(context, "reservation_info",
                              arguments: reservation);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                title: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, bottom: 0, left: 10),
                                    child: Text('Reserva pendiente',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                        ))),
                                subtitle: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 20, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 0, top: 15, bottom: 5),
                                          child: Row(children: <Widget>[
                                            Text("Horario: ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black)),
                                          ])),
                                      for (var slot
                                          in reservation.timeTable.slots)
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, bottom: 5),
                                                    child: Text(
                                                        EnumsStrings.weekday[
                                                                slot.weekday] +
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
                                            top: 5,
                                          ),
                                          child: Row(children: <Widget>[
                                            Text('Frecuencia: ',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black)),
                                            Text(
                                                EnumsStrings
                                                        .reservationFrequency[
                                                    reservation.frecuency],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ))
                                          ])),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ))
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
