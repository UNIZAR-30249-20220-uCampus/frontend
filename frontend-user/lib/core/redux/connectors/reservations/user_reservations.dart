import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/locator.dart';
import 'package:ucampus/ui/widgets/reservation/user_reservations.dart';
import 'package:device_id/device_id.dart';

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
  String _deviceid = '';

  ViewModel.build({
    @required this.reservationFilterCriteria,
    @required this.userReservations,
  }) : super(equals: [reservationFilterCriteria]);

  Future<String> initDeviceId() async {
   String deviceid = await DeviceId.getID;
    return deviceid;
  }

  Future<List<Reservation>> getReservations(String userID) async {
    ApiService apiService = locator<ApiService>();
    Future<List<Reservation>> reservations;
    String userID = await initDeviceId();
      reservations = apiService.getReservation(userID);
    return reservations;
  }


  @override
  BaseModel fromStore() => ViewModel.build(
        reservationFilterCriteria: state.reservationFilterCriteria,
        userReservations: getReservations(_deviceid),
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
