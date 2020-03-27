import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';

class ReservationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    Space espacio = rcvdData['espacio'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Reservar'),
        ),
        body: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(children: <Widget>[
            ])));
  }
}
