import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:latlong/latlong.dart';

class HttpApi implements ApiService {
  @override
  Future<Space> getSpaceInformation(int floor, LatLng coordinates) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Space>> filterSpaces(FilterCriteria criteria) async {
    throw UnimplementedError();
  }

  @override
  Future<ReservationResult> makeReservation(
    Timetable time,
    String spaceID,
    bool isForRent,
    String userID
  ) {
    throw UnimplementedError();
  }

  @override
  Future<List<Reservation>> getSpaceReservation(String spaceID) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Reservation>> getReservation() async {
    throw UnimplementedError();
  }

  @override
  Future<CancelReservationResult> cancelReservation(
      String reservationID) async {
    throw UnimplementedError();
  }

  @override
  Future<PaymentReservationResult> paymentReservation(
    String reservationID,
    Payment paymentConfirmation,
  ) async {
    throw UnimplementedError();
  }
}
