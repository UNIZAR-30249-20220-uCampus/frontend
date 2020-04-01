import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/redux/connectors/space_info/reservation_button.dart';
import 'package:ucampus/ui/widgets/space_info/reservation_form.dart';

class ReservationScreen extends StatelessWidget {
  final Space space;

  ReservationScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservar espacio'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 10, right: 10, left: 10, child: ReservationForm(space: space)),
          Positioned(
              bottom: 55,
              right: 10,
              left: 10,
              child: ReservationButtonConnector()),
        ],
      ),
    );
  }
}
