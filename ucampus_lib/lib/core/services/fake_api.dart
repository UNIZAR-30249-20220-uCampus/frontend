import 'dart:convert';

import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
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
    String userID
  ) async {
    await Future.delayed(Duration(milliseconds: 700));
    return ReservationResult.success; // TODO
  }

  @override
  Future<List<Reservation>> getSpaceReservation(String spaceID) async {
    await Future.delayed(Duration(milliseconds: 700));
    return List.generate(
      5,
      (index) => Reservation.randomReservation(labNumber: index),
    );
  }

  @override
  Future<List<Reservation>> getSpacePendingReservation(String spaceID) async {
    await Future.delayed(Duration(milliseconds: 700));
    return List.generate(
      5,
      (index) => Reservation.randomReservation(labNumber: index),
    );
  }

  @override
  Future<List<Reservation>> getReservation(String userID) async {
    await Future.delayed(Duration(milliseconds: 700));
    return List.generate(
      15,
      (index) => Reservation.randomReservation(labNumber: index),
    );
  }

  @override
  Future<CancelReservationResult> cancelReservation(
      int reservationID) async {
    await Future.delayed(Duration(milliseconds: 700));
    return CancelReservationResult.success; // TODO
  }

  @override
  Future<PaymentReservationResult> paymentReservation(
    int reservationID,
    Payment paymentConfirmation,
  ) async {
    await Future.delayed(Duration(milliseconds: 700));
    return PaymentReservationResult.success; 
  }

  @override
  Future<AcceptReservationResult> acceptReservation(
      int reservationID) async {
    await Future.delayed(Duration(milliseconds: 700));
    return AcceptReservationResult.success; // TODO
  }

  @override
  Future<UpdateEquipmentResult> updateEquipment(
      String spaceID, List<Equipment> newEquipment) async {
        await Future.delayed(Duration(milliseconds: 700));
        var newEquipmentBody = {};
    newEquipmentBody["nombre"] = spaceID;
    newEquipmentBody["equipamientos"] = newEquipment;
    /*
    newEquipmentBody["equipamientos"] = newEquipment
          ?.map((e) => e.toJson())
          ?.toList();*/
    newEquipmentBody["filtrosActivos"] = ["NOMBRE"];

    print(json.encode(newEquipmentBody));
    return UpdateEquipmentResult.success; // TODO
  }

   @override
  Future<List<Reservation>> getAllReservations() async {
        await Future.delayed(Duration(milliseconds: 700));
    return List.generate(
      15,
      (index) => Reservation.randomReservation(labNumber: index),
    );
  }
}
