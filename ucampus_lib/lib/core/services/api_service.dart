import 'package:latlong/latlong.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';

enum ReservationResult { success, error }
enum CancelReservationResult { success, error }
enum PaymentReservationResult { success, error }

abstract class ApiService {
  Future<Space> getSpaceInformation(int floor, LatLng coordinates);

  Future<List<Space>> filterSpaces(FilterCriteria criteria);

  Future<ReservationResult> makeReservation(
    Timetable time,
    String spaceID,
    bool isForRent,
  );
 
  Future<List<Reservation>> getSpaceReservation(String spaceID);

  Future<List<Reservation>> getReservation();

  Future<CancelReservationResult> cancelReservation(String reservationID);

  Future<PaymentReservationResult> paymentReservation(
    String reservationID,
    Payment paymentConfirmation,
  );
}
