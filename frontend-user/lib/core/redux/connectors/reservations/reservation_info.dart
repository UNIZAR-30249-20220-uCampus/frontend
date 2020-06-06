import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/ui/widgets/reservation/reservation_info_card.dart';

class ReservationInfoConnector extends StatelessWidget {
  final Reservation reservation;
  
  ReservationInfoConnector({
    @required this.reservation,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          ReservationInfoCard(reservation: reservation, onCancel: model.onCancel),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  Function(String) onCancel;

  ViewModel.build({
    @required this.onCancel,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
      onCancel: (reservationID) => dispatch(CancelReservationAction(reservationID: reservationID)));
}
