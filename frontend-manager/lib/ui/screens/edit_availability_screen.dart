import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_manager/core/redux/connectors/space_info/edit_availability.dart';

class EditAvailabilityScreen extends StatelessWidget {
  final Space space;

  EditAvailabilityScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disponibilidad del espacio'),
      ),
      body: EditAvailabilityConnector(space: space));
  }
}
