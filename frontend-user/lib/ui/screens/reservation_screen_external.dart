import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/connectors/space_info/reservation_form_external.dart';
import 'package:ucampus_lib/core/models/reservation.dart';

class ReservationScreenExternal extends StatelessWidget {
  final Reservation reservation;

  ReservationScreenExternal({
    @required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservar espacio'),
      ),
      body: ReservationFormExternalConnector(reservation: reservation));
  }
}
