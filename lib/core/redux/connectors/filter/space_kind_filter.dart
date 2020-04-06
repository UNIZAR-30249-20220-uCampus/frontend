import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/redux/actions/filter_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/filter/space_kind_filter.dart';

class SpaceKindFilterConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        model: ViewModel(),
        builder: (context, model) => SpaceKindFilter(
              onFilterAdded: model.onFilterAdded,
              onFilterRemoved: model.onFilterRemoved,
              isEnabled: model.isEnabled,
              onFilterSelectionSet: model.onFilterSelectionSet,
              selectedSpaceKinds: model.selectedSpaceKinds,
            ));
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function onFilterAdded;
  Function onFilterRemoved;
  Function(List<SpaceKind>) onFilterSelectionSet;
  bool isEnabled;
  List<SpaceKind> selectedSpaceKinds;

  ViewModel.build({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onFilterSelectionSet,
    @required this.isEnabled,
    @required this.selectedSpaceKinds,
  }) : super(equals: [selectedSpaceKinds, isEnabled]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onFilterAdded: () => dispatch(
          AddFilterCriteriaAction(criteriaKind: CriteriaKind.KIND),
        ),
        onFilterRemoved: () => dispatch(
          RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.KIND),
        ),
        isEnabled:
            state.filterCriteria.activeCriteria.contains(CriteriaKind.KIND),
        onFilterSelectionSet: (selection) => dispatch(SetFilterValueAction(
            criteriaKind: CriteriaKind.KIND, value: selection)),
        selectedSpaceKinds: state.filterCriteria.kinds,
      );
}
