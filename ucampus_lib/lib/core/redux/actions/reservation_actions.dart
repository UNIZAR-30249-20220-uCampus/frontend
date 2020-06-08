import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/loading_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/locator.dart';

class ReservationAction extends ReduxAction<AppState> {
  final Timetable time;
  final String spaceID;
  final bool isForRent;
  final String userID;

  ReservationAction(
      {@required this.time, @required this.spaceID, @required this.isForRent, this.userID});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    ReservationResult reservationResult = await apiService.makeReservation(
      this.time,
      this.spaceID,
      this.isForRent,
      this.userID
    );
    dispatch(SetLoadingAction(isLoading: false));

    if (reservationResult == ReservationResult.error) {
      throw UserException("La reserva no ha podido realizarse.");
    } else if (reservationResult == ReservationResult.success) {
      return state;
    } else {
      return null;
    }
  }
}

class CancelReservationAction extends ReduxAction<AppState> {
  final int reservationID;

  CancelReservationAction(
      {@required this.reservationID});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    CancelReservationResult reservationResult = await apiService.cancelReservation(
      this.reservationID,
    );
    dispatch(SetLoadingAction(isLoading: false));

    if (reservationResult == CancelReservationResult.error) {
       throw UserException("La reserva no ha podido cancelarse.");
    } else if (reservationResult == CancelReservationResult.success) {
      return state;
    } else {
      return null;
    }
  }
}

class AcceptReservationAction extends ReduxAction<AppState> {
  final int reservationID;

  AcceptReservationAction(
      {@required this.reservationID});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    AcceptReservationResult reservationResult = await apiService.acceptReservation(
      this.reservationID,
    );
    dispatch(SetLoadingAction(isLoading: false));

    if (reservationResult == AcceptReservationResult.error) {
      throw UserException("La reserva no ha podido aceptarse.");
    } else if (reservationResult == AcceptReservationResult.success) {
      return state;
    } else {
      return null;
    }
  }
}

class PayReservationAction extends ReduxAction<AppState> {
  final int reservationID;
  final Payment payment;

  PayReservationAction(
      {@required this.reservationID, @required this.payment});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    PaymentReservationResult reservationResult = await apiService.paymentReservation(
      this.reservationID,this.payment

    );
    dispatch(SetLoadingAction(isLoading: false));

    if (reservationResult == PaymentReservationResult.error) {
       throw UserException("El pago no ha podido realizarse");
    } else if (reservationResult == PaymentReservationResult.success) {
      return state;
    } else {
      return null;
    }
  }
}
