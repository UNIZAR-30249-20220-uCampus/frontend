import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/connectors/space_info/reservation_form.dart';
import 'package:ucampus_lib/core/models/space.dart';

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
      body: ReservationFormConnector(space: space));
  }
}
