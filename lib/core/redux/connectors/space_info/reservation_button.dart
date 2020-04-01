import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/core/redux/actions/reservation_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/space_info/reservation_button.dart';

class ReservationButtonConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          ReservationButton(onReservation: model.onReservation),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(Timetable, String, bool) onReservation;

  ViewModel.build({
    @required this.onReservation,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
      onReservation: (time, spaceID, isForRent) => dispatch(ReservationAction(
          time: time, spaceID: spaceID, isForRent: isForRent)));
}
