import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/ui/widgets/filter/capacity_filter.dart';

class CapacityFilterConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        model: ViewModel(),
        builder: (context, model) => CapacityFilter(
              onFilterAdded: model.onFilterAdded,
              onFilterRemoved: model.onFilterRemoved,
              onFilterValueSet: model.onFilterValueSet,
              isEnabled: model.isEnabled,
              currentCapacity: model.currentCapacity,
            ));
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function onFilterAdded;
  Function onFilterRemoved;
  Function(int) onFilterValueSet;
  bool isEnabled;
  int currentCapacity;

  ViewModel.build({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onFilterValueSet,
    @required this.isEnabled,
    @required this.currentCapacity,
  }) : super(equals: [currentCapacity, isEnabled]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onFilterAdded: () => dispatch(
          AddFilterCriteriaAction(criteriaKind: CriteriaKind.CAPACITY),
        ),
        onFilterRemoved: () => dispatch(
          RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.CAPACITY),
        ),
        onFilterValueSet: (value) => dispatch(
          SetFilterValueAction(
            criteriaKind: CriteriaKind.CAPACITY,
            value: value,
          ),
        ),
        isEnabled: state.filterCriteria.activeCriteria.contains(CriteriaKind.CAPACITY),
        currentCapacity: state.filterCriteria.capacity,
      );
}
