import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';

class AddReservationFilterCriteriaAction extends ReduxAction<AppState> {
  final List<ReservationStatus> reservationFilterCriteria;

  AddReservationFilterCriteriaAction(
      {@required this.reservationFilterCriteria});

  @override
  AppState reduce() {
    return state.copy(reservationFilterCriteria: reservationFilterCriteria);
  }
}
