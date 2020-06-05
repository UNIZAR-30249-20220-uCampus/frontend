import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/reservation/reservation_form.dart';
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
          ReservationInfoCard(reservation: reservation, onCancel: model.onCancel, onPay: model.onPay,),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();
  Function(int) onCancel;
  Function(int, Payment) onPay;

  ViewModel.build({
    @required this.onCancel,
    @required this.onPay,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
      onCancel: (reservationID) => dispatch(CancelReservationAction(reservationID: reservationID)),
      onPay: (reservationID, payment) => dispatch(PayReservationAction(reservationID: reservationID, payment: payment)),
      );
}
