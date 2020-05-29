import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/ui/widgets/reservation/reservation_info_card.dart';

class ReservationInfoScreen extends StatelessWidget {
  final Reservation reservation;
  final bool canCancel;


  ReservationInfoScreen({
    @required this.reservation,
    @required this.canCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de reserva'),
      ),
      body: ReservationInfoCard(
                      reservation: reservation,
                      canCancel: canCancel
                    ),
    );
  }
}


