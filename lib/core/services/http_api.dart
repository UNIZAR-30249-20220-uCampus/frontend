import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/payment.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/core/services/api_service.dart';
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
