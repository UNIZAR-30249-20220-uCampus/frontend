import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/connectors/space_info/reservation_form.dart';
import 'package:ucampus_lib/core/models/space.dart';

class ReservationScreen extends StatelessWidget {
  final Space space;
  final bool isExternal;

  ReservationScreen({
    @required this.space,
    @required this.isExternal
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isExternal?Text('Alquilar espacio') :Text('Reservar espacio'),
      ),
      body: ReservationFormConnector(space: space ));
  }
}
