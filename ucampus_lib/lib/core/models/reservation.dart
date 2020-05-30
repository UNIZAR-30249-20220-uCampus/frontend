
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';

enum ReservationStatus { ACCEPTED, REJECTED, PENDING, PENDING_PAYMENT}
enum ReservationFrequency { NO, WEEKLY, MONTHLY, ANNUALLY}

class Reservation {
  final String reservationID;
  final Space space;
  final Timetable timeTable;
  final ReservationFrequency frecuency;
  final ReservationStatus reservationStatus;
  final String userID;

  Reservation({
    @required this.reservationID,
    @required this.space,
    @required this.timeTable,
    @required this.frecuency,
    @required this.reservationStatus,
    @required this.userID
  });

  Reservation copy({
    String reservationID,
    Space espacio,
    Timetable timeTable,
    ReservationFrequency frecuencia,
    ReservationStatus reservationStatus,
    String userID

  }) =>
      Reservation(
        reservationID: reservationID ?? reservationID,
        space: espacio ?? this.space,
        timeTable: timeTable ?? this.timeTable,
        frecuency: frecuencia ?? this.frecuency,
        reservationStatus: reservationStatus ?? this.reservationStatus,
        userID: userID ?? this.userID
      );

  static Reservation randomReservation({int labNumber}) {
    final _random = Random();
    return Reservation(
      reservationID: '1',
      space: Space.randomSpace(labNumber: labNumber),
      timeTable: Timetable.randomTimetable(),
      frecuency: ReservationFrequency.values[_random.nextInt(ReservationFrequency.values.length)],
      reservationStatus: ReservationStatus.values[_random.nextInt(ReservationStatus.values.length)],
      userID: '1'
    );
  }

}
