import 'package:latlong/latlong.dart';

enum ReservationResult { success, error }
enum CancelReservationResult { success, error }
enum PaymentReservationResult { success, error }

abstract class ApiService {
  Space getSapceInformation(int floor, LatLng coordinates);

  List<Space> filterSpaces(FilterCriteria criteria);

  ReservationResult makeReservation(
      TimeTable time, String spaceID, bool isForRent);

  List<Reservation> getSpaceReservation(String spaceID);

  List<Reservation> getReservation();

  CancelReservationResult cancelReservation(String reservationID);

  PaymentReservationResult paymentReservation(
      String reservationID, Payment paymentConfirmation);
}
