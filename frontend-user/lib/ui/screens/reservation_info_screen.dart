import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/ui/widgets/reservation/reservation_info_card.dart';
import 'package:ucampus/core/redux/connectors/reservations/reservation_info.dart';

class ReservationInfoScreen extends StatelessWidget {
  final Reservation reservation;


  ReservationInfoScreen({
    @required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de reserva'),
      ),
      body: ReservationInfoConnector(
                      reservation: reservation,
                    ),
    );
  }
}


