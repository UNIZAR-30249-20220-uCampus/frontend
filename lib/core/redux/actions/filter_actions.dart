import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus/core/models/equipment.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/redux/app_state.dart';

class AddFilterCriteriaAction extends ReduxAction<AppState> {
  final CriteriaKind criteriaKind;
  final value;

  AddFilterCriteriaAction({@required this.criteriaKind, @required this.value});

  @override
  AppState reduce() {
    if (state.filterCriteria.activeCriteria.contains(criteriaKind)) {
      return null;
    }
    FilterCriteria newCriteria = state.filterCriteria.copy(
        activeCriteria: state.filterCriteria.activeCriteria.toList()
          ..add(criteriaKind));

    switch (criteriaKind) {
      case CriteriaKind.NAME:
        newCriteria = newCriteria.copy(name: value as String);
        break;
      case CriteriaKind.KIND:
        newCriteria = newCriteria.copy(kind: value as String);
        break;
      case CriteriaKind.CAPACITY:
        newCriteria = newCriteria.copy(capacity: value as int);
        break;
      case CriteriaKind.EQUIPMENT:
        newCriteria = newCriteria.copy(equipments: value as List<Equipment>);
        break;
      case CriteriaKind.SURFACE:
        newCriteria = newCriteria.copy(surface: value as double);
        break;
      case CriteriaKind.TIMETABLE:
        //TODO:implementar TimeTable
        break;
    }

    return state.copy(filterCriteria: newCriteria);
  }
}

class RemoveFilterCriteriaAction extends ReduxAction<AppState> {
  final CriteriaKind criteriaKind;

  RemoveFilterCriteriaAction({@required this.criteriaKind});

  @override
  AppState reduce() {
    if (!state.filterCriteria.activeCriteria.contains(criteriaKind)) {
      return null;
    }
    FilterCriteria newCriteria = state.filterCriteria.copy(
        activeCriteria: state.filterCriteria.activeCriteria.toList()
          ..remove(criteriaKind));

    switch (criteriaKind) {
      case CriteriaKind.NAME:
        newCriteria = newCriteria.copy(name: null);
        break;
      case CriteriaKind.KIND:
        newCriteria = newCriteria.copy(kind: null);
        break;
      case CriteriaKind.CAPACITY:
        newCriteria = newCriteria.copy(capacity: null);
        break;
      case CriteriaKind.EQUIPMENT:
        newCriteria = newCriteria.copy(equipments: null);
        break;
      case CriteriaKind.SURFACE:
        newCriteria = newCriteria.copy(surface: null);
        break;
      case CriteriaKind.TIMETABLE:
        //TODO:implementar TimeTable
        break;
    }

    return state.copy(filterCriteria: newCriteria);
  }
}

class CleanFilterCriteriaAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copy(filterCriteria: FilterCriteria.cleanCritera());
  }
}
