import 'package:flutter/material.dart';
import 'package:ucampus/data/espacio.dart';

class RentalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    Espacio espacio = rcvdData['espacio'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Alquilar'),
        ),
        body: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(children: <Widget>[
            ])));
  }
}
