import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/redux/actions/filter_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/filter/mini_filter_display.dart';

class MiniFilterDisplayConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => MiniFilterDisplay(
        activeCriteria: model.activeCriteria,
        onCriteriaRemoved: model.onCriteriaRemoved,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  List<CriteriaKind> activeCriteria;
  Function(CriteriaKind) onCriteriaRemoved;

  ViewModel.build(
      {@required this.activeCriteria, @required this.onCriteriaRemoved})
      : super(equals: activeCriteria);

  @override
  BaseModel fromStore() => ViewModel.build(
        activeCriteria: state.filterCriteria.activeCriteria,
        onCriteriaRemoved: (criteria) =>
            dispatch(RemoveFilterCriteriaAction(criteriaKind: criteria)),
      );
}
