import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/redux/connectors/space_info/rental_form.dart';

class RentalScreen extends StatelessWidget {
  final Space space;

  RentalScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alquilar espacio'),
        ),
        body: RentalFormConnector(space: space));
  }
}
