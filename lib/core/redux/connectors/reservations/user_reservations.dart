import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:ucampus/locator.dart';
import 'package:ucampus/ui/widgets/reservations/user_reservations.dart';

class UserReservationsConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      distinct: true,
      model: ViewModel(),
      builder: (context, model) => UserReservations(
        reservationFilterCriteria: model.reservationFilterCriteria,
        userReservations: model.userReservations,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  List<ReservationStatus> reservationFilterCriteria;
  Future<List<Reservation>> userReservations;

  ViewModel.build({
    @required this.reservationFilterCriteria,
    @required this.userReservations,
  }) : super(equals: [reservationFilterCriteria]);

  Future<List<Reservation>> getReservations() async {
    ApiService apiService = locator<ApiService>();
    return await apiService.getReservation();
  }

  @override
  BaseModel fromStore() => ViewModel.build(
        reservationFilterCriteria: state.reservationFilterCriteria,
        userReservations: getReservations(),
      );

  @override
  int get hashCode =>
      this.reservationFilterCriteria.hashCode ^ this.userReservations.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ViewModel &&
            this.reservationFilterCriteria == other.reservationFilterCriteria &&
            this.userReservations == other.userReservations);
  }
}
