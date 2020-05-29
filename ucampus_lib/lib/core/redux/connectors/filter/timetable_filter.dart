import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/ui/widgets/filter/timetable_filter.dart';

class TimetableFilterConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        model: ViewModel(),
        builder: (context, model) => TimetableFilter(
              onFilterAdded: model.onFilterAdded,
              onFilterRemoved: model.onFilterRemoved,
              isEnabled: model.isEnabled,
              initialTimetable: model.initialTimetable,
              onTimetableChange: model.onTimetableChange,
            ));
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function onFilterAdded;
  Function onFilterRemoved;
  Function(Timetable) onTimetableChange;
  Timetable initialTimetable;
  bool isEnabled;

  ViewModel.build({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onTimetableChange,
    @required this.isEnabled,
    @required this.initialTimetable,
  }) : super(equals: [initialTimetable, isEnabled]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onFilterAdded: () => dispatch(
          AddFilterCriteriaAction(criteriaKind: CriteriaKind.TIMETABLE),
        ),
        onFilterRemoved: () => dispatch(
          RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.TIMETABLE),
        ),
        onTimetableChange: (newTimetable) => dispatch(SetFilterValueAction(
            criteriaKind: CriteriaKind.TIMETABLE, value: newTimetable)),
        isEnabled: state.filterCriteria.activeCriteria
            .contains(CriteriaKind.TIMETABLE),
        initialTimetable: state.filterCriteria.timetable,
      );
}
