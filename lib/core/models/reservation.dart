
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:ucampus/core/models/space.dart';

enum ReservationStatus { ACCEPTED, REJECTED, PENDING, PENDING_PAYMENT}

class Reservation {
  final Space espacio;
  final DateTime inicio;
  final DateTime fin;
  final String frecuencia;
  final ReservationStatus reservationStatus;

  Reservation({
    @required this.espacio,
    @required this.inicio,
    @required this.fin,
    @required this.frecuencia,
    @required this.reservationStatus,
  });

  Reservation copy({
    Space espacio,
    DateTime inicio,
    DateTime fin,
    String frecuencia,
    ReservationStatus reservationStatus,

  }) =>
      Reservation(
        espacio: espacio ?? this.espacio,
        inicio: inicio ?? this.inicio,
        fin: fin ?? this.fin,
        frecuencia: frecuencia ?? this.frecuencia,
        reservationStatus: reservationStatus ?? this.reservationStatus,
      );

  static Reservation randomReservation({int labNumber}) {
    final _random = Random();
    return Reservation(
      espacio: Space.randomSpace(labNumber: labNumber),
      inicio: DateTime.now(),
      fin: DateTime.now(),
      frecuencia: 'no',
      reservationStatus: ReservationStatus.values[_random.nextInt(ReservationStatus.values.length)],
    );
  }

}
