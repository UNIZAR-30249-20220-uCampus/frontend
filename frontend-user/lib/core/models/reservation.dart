
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/models/timetable.dart';

enum ReservationStatus { ACCEPTED, REJECTED, PENDING, PENDING_PAYMENT}
enum ReservationFrequency { NO, WEEKLY, MONTHLY, ANNUALLY}

class Reservation {
  final Space space;
  final Timetable timeTable;
  final ReservationFrequency frecuency;
  final ReservationStatus reservationStatus;

  Reservation({
    @required this.space,
    @required this.timeTable,
    @required this.frecuency,
    @required this.reservationStatus,
  });

  Reservation copy({
    Space espacio,
    Timetable timeTable,
    ReservationFrequency frecuencia,
    ReservationStatus reservationStatus,

  }) =>
      Reservation(
        space: espacio ?? this.space,
        timeTable: timeTable ?? this.timeTable,
        frecuency: frecuencia ?? this.frecuency,
        reservationStatus: reservationStatus ?? this.reservationStatus,
      );

  static Reservation randomReservation({int labNumber}) {
    final _random = Random();
    return Reservation(
      space: Space.randomSpace(labNumber: labNumber),
      timeTable: Timetable.randomTimetable(),
      frecuency: ReservationFrequency.values[_random.nextInt(ReservationFrequency.values.length)],
      reservationStatus: ReservationStatus.values[_random.nextInt(ReservationStatus.values.length)],
    );
  }

}
