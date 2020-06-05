
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

enum ReservationStatus { PENDIENTE, PENDIENTEPAGO, ACEPTADA, CANCELADA}


@JsonSerializable()
class Reservation {
  @JsonKey(name: 'id')
  final int reservationID;
  @JsonKey(name: 'usuario')
  final String userID;
  @JsonKey(name: 'espacio')
  final String space;
  @JsonKey(name: 'horario')
  final Timetable timeTable;
  @JsonKey(name: 'estado')
  final ReservationStatus reservationStatus;
  

  Reservation({
    @required this.reservationID,
    @required this.space,
    @required this.timeTable,
    @required this.reservationStatus,
    @required this.userID
  });

  Reservation copy({
    int reservationID,
    String space,
    Timetable timeTable,
    ReservationStatus reservationStatus,
    String userID

  }) =>
      Reservation(
        reservationID: reservationID ?? reservationID,
        space: space ?? this.space,
        timeTable: timeTable ?? this.timeTable,
        reservationStatus: reservationStatus ?? this.reservationStatus,
        userID: userID ?? this.userID
      );

  static Reservation randomReservation({int labNumber}) {
    final _random = Random();
    return Reservation(
      reservationID: 1,
      space: Space.randomSpace(labNumber: labNumber).uuid,
      timeTable: Timetable.randomTimetable(),
      reservationStatus: ReservationStatus.values[_random.nextInt(ReservationStatus.values.length)],
      userID: '1'
    );
  }

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationToJson(this);

}
