import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_manager/ui/widgets/space_info/edit_equipment_form.dart';
import 'package:ucampus_lib/core/redux/actions/edit_equipment_actions.dart';

class EditEquipmentConnector extends StatelessWidget {
  final Space space;
  
  EditEquipmentConnector({
    @required this.space,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          EditEquipmentForm(space: space, onEdit: model.onEdit),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(String, List<Equipment>) onEdit;

  ViewModel.build({
    @required this.onEdit,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
       onEdit: (spaceID, newEquipment) => dispatch(EditEquipmentAction(
          newEquipment: newEquipment, spaceID: spaceID)));
}
