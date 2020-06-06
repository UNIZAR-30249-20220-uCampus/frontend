import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:utm/utm.dart';
import 'dart:async';
import 'dart:convert';

class HttpApi implements ApiService {
  final String _baseUrl = "http://api.ucampus.xyz/api";

  @override
  Future<Space> getSpaceInformation(int floor, LatLng coordinates) async {
    final utm =
        UTM.fromLatLon(lat: coordinates.latitude, lon: coordinates.longitude);
    double long = utm.easting;
    double lat = utm.northing;
    final response = await http.get(_baseUrl + '/espacios/$floor/$long/$lat');

    if (response.statusCode == 200) {
      return Space.fromJson(json.decode(response.body));
    } else {
      return null; //TODO
    }
  }

  @override
  Future<List<Space>> filterSpaces(FilterCriteria criteria) async {
    final http.Response response = await http.post(
      _baseUrl + '/buscar-espacio/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(criteria),
    );
    if (response.statusCode == 200) {
      var list = (json.decode(response.body) as List)
          .map((data) => Space.fromJson(data))
          .toList();
      return list;
    } else {
      return null; //TODO
    }
    
  }

  @override
  Future<ReservationResult> makeReservation(
      Timetable time, String spaceID, bool isForRent, String userID) async {
    var reserva = {};
    reserva["horario"] = time.toJson();
    reserva["tipo"] = !isForRent? "reserva": "alquiler";
    reserva["usuario"] = userID;
    
    final http.Response response = await http.post(
      _baseUrl + '/crear-reserva/$spaceID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(reserva),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      
      return ReservationResult.success;
    } else {
      return ReservationResult.error;
    }
  }

  @override
  Future<List<Reservation>> getSpaceReservation(String spaceID) async {
    final response = await http.get(_baseUrl + '/reservas/$spaceID');

    if (response.statusCode == 200) {
      var list = (json.decode(response.body) as List)
          .map((data) => Reservation.fromJson(data))
          .toList();
      return list;
    } else {
      return null; //TODO
    }
  }

  @override
  Future<List<Reservation>> getReservation(String userID) async {
    final response = await http.get(_baseUrl + '/reservas-usuario/$userID');

    if (response.statusCode == 200) {
      var list = (json.decode(response.body) as List)
          .map((data) => Reservation.fromJson(data))
          .toList();
      return list;
    } else {
      return null; //TODO
    }
  }

  @override
  Future<CancelReservationResult> cancelReservation(
      int reservationID) async {
     final response = await http.put(_baseUrl + '/cancelar-reserva/$reservationID');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CancelReservationResult.success;
    } else {
      return CancelReservationResult.error;
    }
  }

  @override
  Future<PaymentReservationResult> paymentReservation(
    int reservationID,
    Payment paymentConfirmation,
  ) async {
    final response = await http.put(_baseUrl + '/pagar-reserva/$reservationID');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return PaymentReservationResult.success;
    } else {
      return PaymentReservationResult.error;
    }
  }
}
