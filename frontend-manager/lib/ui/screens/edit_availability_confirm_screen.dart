import 'package:flutter/material.dart';
import 'package:ucampus_manager/ui/widgets/space_info/edit_availability_confirm.dart';

class EditAvailabilityConfirmScreen extends StatelessWidget {

  EditAvailabilityConfirmScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disponibilidad del espacio'),
      ),
      body: EditAvailabilityConfirm());
  }
}
