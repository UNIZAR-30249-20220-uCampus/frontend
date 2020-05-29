import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/ui/widgets/filter/equipment_filter.dart';

class EquipmentFilterConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => EquipmentFilter(
        onFilterAdded: model.onFilterAdded,
        onFilterRemoved: model.onFilterRemoved,
        onFilterSelectionSet: model.onFilterSelectionSet,
        isEnabled: model.isEnabled,
        selectedEquipments: model.selectedEquipments,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function onFilterAdded;
  Function onFilterRemoved;
  Function(List<Equipment>) onFilterSelectionSet;
  bool isEnabled;
  List<Equipment> selectedEquipments;

  ViewModel.build({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onFilterSelectionSet,
    @required this.isEnabled,
    @required this.selectedEquipments,
  }) : super(equals: [selectedEquipments, isEnabled]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onFilterAdded: () => dispatch(
          AddFilterCriteriaAction(criteriaKind: CriteriaKind.EQUIPMENT),
        ),
        onFilterRemoved: () => dispatch(
          RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.EQUIPMENT),
        ),
        onFilterSelectionSet: (selection) => dispatch(SetFilterValueAction(
            criteriaKind: CriteriaKind.EQUIPMENT, value: selection)),
        isEnabled: state.filterCriteria.activeCriteria
            .contains(CriteriaKind.EQUIPMENT),
        selectedEquipments: state.filterCriteria.equipments,
      );
}
