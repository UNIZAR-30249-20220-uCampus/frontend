
import 'dart:math';
import 'package:meta/meta.dart';

class Reservation {
  final DateTime inicio;
  final DateTime fin;
  final String frecuencia;

  Reservation({
    @required this.inicio,
    @required this.fin,
    @required this.frecuencia,

  });

  Reservation copy({
    DateTime inicio,
    DateTime fin,
    String frecuencia,

  }) =>
      Reservation(
        inicio: inicio ?? this.inicio,
        fin: fin ?? this.fin,
        frecuencia: frecuencia ?? this.frecuencia,
      );

  static Reservation randomReservation({int labNumber}) {
    final _random = Random();
    return Reservation(
      inicio: DateTime.now(),
      fin: DateTime.now(),
      frecuencia: 'no',
    );
  }

}
