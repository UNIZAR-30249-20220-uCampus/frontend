import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/connectors/reservations/reservation_filter.dart';
import 'package:ucampus/core/redux/connectors/reservations/user_reservations.dart';
import 'package:ucampus/ui/widgets/drawer.dart';

class UserReservationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis reservas'),
      ),
      drawer: DrawerApp(),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              right: 10,
              left: 10,
              child: ReservationFilterConnector()),
          Positioned(
              top: 100,
              right: 10,
              left: 10,
              bottom: 10,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    
                    UserReservationsConnector(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
