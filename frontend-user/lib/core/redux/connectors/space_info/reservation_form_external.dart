import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/reservation/reservation_form_external.dart';
import 'package:ucampus_lib/core/models/reservation.dart';

class ReservationFormExternalConnector extends StatelessWidget {
  final Reservation reservation;
  
  ReservationFormExternalConnector({
    @required this.reservation,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          ReservationFormExternal(reservation: reservation, onReservation: model.onReservation),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(Timetable, String, bool, String) onReservation;

  ViewModel.build({
    @required this.onReservation,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
      onReservation: (time, spaceID, isForRent, userID) => dispatch(ReservationAction(
          time: time, spaceID: spaceID, isForRent: isForRent, userID: userID)));
}
