import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_manager/core/redux/connectors/space_info/edit_bookable.dart';

class EditBookableScreen extends StatelessWidget {
  final Space space;

  EditBookableScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones del espacio'),
      ),
      body: EditBookableConnector(space: space));
  }
}
