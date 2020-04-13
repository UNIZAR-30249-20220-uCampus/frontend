import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/ui/widgets/space_info/pending_reservations_card.dart';
import 'package:ucampus/ui/widgets/space_info/reservation_rental_dial.dart';
import 'package:ucampus/ui/widgets/space_info/space_info_card.dart';

class SpaceInfoScreen extends StatelessWidget {
  final Space space;

  SpaceInfoScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos del espacio'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SpaceInfoCard(
                      space: space,
                    ),
                    PendingReservationsCard(
                      space: space,
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 30,
              right: 10,
              left: 0,
              child: ReservationRentalDial(
                space: space,
              )),
        ],
      ),
    );
  }
}
