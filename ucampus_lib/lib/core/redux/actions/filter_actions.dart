import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';

class SetFilterValueAction extends ReduxAction<AppState> {
  final CriteriaKind criteriaKind;
  final value;

  SetFilterValueAction({@required this.criteriaKind, @required this.value});

  @override
  AppState reduce() {
    if (!state.filterCriteria.activeCriteria.contains(criteriaKind)) {
      return null;
    }
    FilterCriteria newCriteria = state.filterCriteria;
    switch (criteriaKind) {
      case CriteriaKind.NAME:
        newCriteria = newCriteria.copy(name: value as String);
        break;
      case CriteriaKind.KIND:
        newCriteria = newCriteria.copy(kinds: value as List<SpaceKind>);
        break;
      case CriteriaKind.CAPACITY:
        newCriteria = newCriteria.copy(capacity: value as int);
        break;
      case CriteriaKind.EQUIPMENT:
        List<Equipment> newEquipment = [];
        (value as List<Equipment>).forEach((equipment) {
          int index = newEquipment.indexWhere(
              (element) => element.equipmentKind == equipment.equipmentKind);
          if (index == -1) {
            newEquipment.add(equipment);
          } else {
            int previuosAmount =
                (value as List<Equipment>).elementAt(index).amount;
            newEquipment.removeAt(index);
            newEquipment.add(Equipment(
                equipmentKind: equipment.equipmentKind,
                amount: previuosAmount + equipment.amount));
          }
        });
        newCriteria = newCriteria.copy(equipments: newEquipment);
        break;
      case CriteriaKind.TIMETABLE:
        newCriteria = newCriteria.copy(timetable: value as Timetable);
        break;
    }
    return state.copy(filterCriteria: newCriteria);
  }
}

class AddFilterCriteriaAction extends ReduxAction<AppState> {
  final CriteriaKind criteriaKind;

  AddFilterCriteriaAction({@required this.criteriaKind});

  @override
  AppState reduce() {
    if (state.filterCriteria.activeCriteria.contains(criteriaKind)) {
      return null;
    }
    return state.copy(
        filterCriteria: state.filterCriteria.copy(
            activeCriteria: List.of(state.filterCriteria.activeCriteria)
              ..add(criteriaKind)));
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
    return state.copy(
        filterCriteria: state.filterCriteria.copy(
            activeCriteria: List.of(state.filterCriteria.activeCriteria)
              ..remove(criteriaKind)));
  }
}

class CleanFilterCriteriaAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copy(filterCriteria: FilterCriteria.cleanCritera());
  }
}

class RemoveAndCopyCriteriaAction extends ReduxAction<AppState> {
  final CriteriaKind criteriaKindToRemove;

  RemoveAndCopyCriteriaAction({@required this.criteriaKindToRemove});

  @override
  AppState reduce() {
    return state.copy(
      filterCriteria: state.filterCriteria.copy(
          activeCriteria: List.of(state.appliedCriteria)
            ..remove(criteriaKindToRemove)),
    );
  }
}
