import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_manager/core/redux/connectors/space_info/edit_equipment.dart';

class EditEquipmentScreen extends StatelessWidget {
  final Space space;

  EditEquipmentScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamiento del espacio'),
      ),
      body: EditEquipmentConnector(space: space));
  }
}
