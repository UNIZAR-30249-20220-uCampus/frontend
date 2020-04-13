import 'package:meta/meta.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';

@immutable
class AppState {
  final List<Space> featuredSpaces;
  final FilterCriteria filterCriteria;
  final int currentFloor;
  final bool isLoading;
  final List<ReservationStatus> reservationFilterCriteria;

  AppState({
    @required this.featuredSpaces,
    @required this.filterCriteria,
    @required this.currentFloor,
    @required this.isLoading,
    @required this.reservationFilterCriteria,
  });

  static AppState initialState() => AppState(
        featuredSpaces: [],
        filterCriteria: FilterCriteria.cleanCritera(),
        currentFloor: 0,
        isLoading: false,
        reservationFilterCriteria: [],
      );

  AppState copy({
    List<Space> featuredSpaces,
    FilterCriteria filterCriteria,
    int currentFloor,
    bool isLoading,
    List<ReservationStatus> reservationOrderCriteria,
  }) =>
      AppState(
        featuredSpaces: featuredSpaces ?? this.featuredSpaces,
        filterCriteria: filterCriteria ?? this.filterCriteria,
        currentFloor: currentFloor ?? this.currentFloor,
        isLoading: isLoading ?? this.isLoading,
        reservationFilterCriteria: reservationOrderCriteria ?? this.reservationFilterCriteria
      );

  @override
  String toString() {
    return this.featuredSpaces.toString() +
        '\n' +
        this.filterCriteria.toString() +
        '\n' +
        'currentFloor: ' +
        this.currentFloor.toString() +
        '\n' +
        'isLoading: ' +
        this.isLoading.toString();
  }

  @override
  int get hashCode => this.featuredSpaces.hashCode ^ this.filterCriteria.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AppState &&
            this.featuredSpaces == other.featuredSpaces &&
            this.filterCriteria == other.filterCriteria &&
            this.currentFloor == other.currentFloor &&
            this.isLoading == this.isLoading);
  }
}
