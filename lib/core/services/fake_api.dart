import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/payment.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:latlong/latlong.dart';

class FakeApi implements ApiService {
  @override
  Future<Space> getSpaceInformation(int floor, LatLng coordinates) async {
    await Future.delayed(Duration(milliseconds: 700));
    return Space.randomSpace();
  }

  @override
  Future<List<Space>> filterSpaces(FilterCriteria criteria) async {
    await Future.delayed(Duration(milliseconds: 700));
    return List.generate(
      6,
      (index) => Space.randomSpace(labNumber: index),
    );
  }

  @override
  Future<ReservationResult> makeReservation(
    Timetable time,
    String spaceID,
    bool isForRent,
  ) async {
    await Future.delayed(Duration(milliseconds: 700));
    throw UnimplementedError();
  }

  @override
  Future<List<Reservation>> getSpaceReservation(String spaceID) async {
    await Future.delayed(Duration(milliseconds: 700));
    throw UnimplementedError();
  }

  @override
  Future<List<Reservation>> getReservation() async {
    await Future.delayed(Duration(milliseconds: 700));
    throw UnimplementedError();
  }

  @override
  Future<CancelReservationResult> cancelReservation(
      String reservationID) async {
    await Future.delayed(Duration(milliseconds: 700));
    throw UnimplementedError();
  }

  @override
  Future<PaymentReservationResult> paymentReservation(
    String reservationID,
    Payment paymentConfirmation,
  ) async {
    await Future.delayed(Duration(milliseconds: 700));
    throw UnimplementedError();
  }
}
