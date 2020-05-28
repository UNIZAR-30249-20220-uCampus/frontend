import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/redux/actions/reservation_filter_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/reservation/reservation_filter.dart';

class ReservationFilterConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => ReservationFilter(
        reservationFilterCriteria: model.reservationFilterCriteria,
        onFilterSelected: model.onFilterSelected,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  List<ReservationStatus> reservationFilterCriteria;
  Function(List<ReservationStatus>) onFilterSelected;

  ViewModel.build({
    @required this.reservationFilterCriteria,
    @required this.onFilterSelected,
  }) : super(equals: [reservationFilterCriteria]);

  @override
  BaseModel fromStore() => ViewModel.build(
      reservationFilterCriteria: state.reservationFilterCriteria,
      onFilterSelected: (criteria) => dispatch(
          AddReservationFilterCriteriaAction(
              reservationFilterCriteria: criteria)),
      );
}
