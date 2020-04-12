import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/space.dart';

@immutable
class AppState {
  final List<Space> featuredSpaces;
  final FilterCriteria filterCriteria;
  final List<CriteriaKind> appliedCriteria;
  final int currentFloor;
  final bool isLoading;

  AppState({
    @required this.featuredSpaces,
    @required this.filterCriteria,
    @required this.appliedCriteria,
    @required this.currentFloor,
    @required this.isLoading,
  });

  static AppState initialState() => AppState(
        featuredSpaces: [],
        filterCriteria: FilterCriteria.cleanCritera(),
        appliedCriteria: [],
        currentFloor: 0,
        isLoading: false,
      );

  AppState copy({
    List<Space> featuredSpaces,
    FilterCriteria filterCriteria,
    List<CriteriaKind> appliedCriteria,
    int currentFloor,
    bool isLoading,
  }) =>
      AppState(
        featuredSpaces: featuredSpaces ?? this.featuredSpaces,
        filterCriteria: filterCriteria ?? this.filterCriteria,
        appliedCriteria: appliedCriteria ?? this.appliedCriteria,
        currentFloor: currentFloor ?? this.currentFloor,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  String toString() {
    return 'featuredSpaces: [...]' +
        //this.featuredSpaces.toString() +
        '\n' +
        this.filterCriteria.toString() +
        '\n' +
        'appliedCriteria: ' +
        this.appliedCriteria.toString() +
        '\n' +
        'currentFloor: ' +
        this.currentFloor.toString() +
        '\n' +
        'isLoading: ' +
        this.isLoading.toString();
  }

  @override
  int get hashCode =>
      this.featuredSpaces.hashCode ^ this.filterCriteria.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AppState &&
            this.featuredSpaces == other.featuredSpaces &&
            this.filterCriteria == other.filterCriteria &&
            listEquals(this.appliedCriteria, other.appliedCriteria) &&
            this.currentFloor == other.currentFloor &&
            this.isLoading == this.isLoading);
  }
}
