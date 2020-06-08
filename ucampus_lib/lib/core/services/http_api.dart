import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
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
      throw new UserException(
          'No ha sido posible obtener información del espacio');
    }
  }

  @override
  Future<List<Space>> filterSpaces(FilterCriteria criteria) async {
    if (!criteria.activeCriteria.contains(CriteriaKind.EQUIPMENT)) {
      criteria = criteria.copy(equipments: []);
    }
    print('CRITERIOS: ' + criteria.toString());
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
      throw new UserException('No ha sido posible realizar la búsqueda');
    }
  }

  @override
  Future<ReservationResult> makeReservation(
      Timetable time, String spaceID, bool isForRent, String userID) async {
    var reserva = {};
    reserva["horario"] = time.toJson();
    reserva["tipo"] = !isForRent ? "reserva" : "alquiler";
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
      throw new UserException(
          'No ha sido posible obtener obtener la lista de reservas del espacio');
    }
  }

  @override
  Future<List<Reservation>> getSpacePendingReservation(String spaceID) async {
    final response = await http.get(_baseUrl + '/reservas/$spaceID/PENDIENTE');
    if (response.statusCode == 200) {
      var list = (json.decode(response.body) as List)
          .map((data) => Reservation.fromJson(data))
          .toList();
      return list;
    } else {
      throw new UserException(
          'No ha sido posible obtener obtener la lista de reservas pendientes del espacio');
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
      throw new UserException(
          'No ha sido posible obtener obtener tus reservas');
    }
  }

  @override
  Future<CancelReservationResult> cancelReservation(int reservationID) async {
    final response =
        await http.put(_baseUrl + '/cancelar-reserva/$reservationID');

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

  @override
  Future<AcceptReservationResult> acceptReservation(int reservationID) async {
    print(reservationID);
    final response =
        await http.put(_baseUrl + '/aceptar-reserva/$reservationID');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AcceptReservationResult.success;
    } else {
      return AcceptReservationResult.error;
    }
  }

  @override
  Future<UpdateEquipmentResult> updateEquipment(
      String spaceID, List<Equipment> newEquipment) async {
    var newEquipmentBody = {};
    spaceID = spaceID.replaceAll('"', '');
    newEquipmentBody["nombre"] = spaceID;
    newEquipmentBody["equipamientos"] = newEquipment;
    newEquipmentBody["filtrosActivos"] = ["NOMBRE"];

    final http.Response response = await http.post(
      _baseUrl + '/equipamiento',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(newEquipmentBody),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return UpdateEquipmentResult.success;
    } else {
      return UpdateEquipmentResult.error;
    }
  }

  @override
  Future<UpdateBookableResult> updateBookable(
      String spaceID, bool bookable) async {
    String value = bookable ? '1' : '0';
    print('LLEGA');
    print(
      _baseUrl + '/cambiar-reservable/' + spaceID + '/' + value);
    final http.Response response = await http.put(
      _baseUrl + '/cambiar-reservable/' + spaceID + '/' + value,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UpdateBookableResult.success;
    } else {
      return UpdateBookableResult.error;
    }
  }

  @override
  Future<UpdateBookableResult> updateLeasable(
      String spaceID, bool leasable) async {
    String value = leasable ? '1' : '0';
    final http.Response response = await http.put(
      _baseUrl + '/cambiar-alquilable/' + spaceID + '/' + value,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UpdateBookableResult.success;
    } else {
      return UpdateBookableResult.error;
    }
  }

  @override
  Future<List<Reservation>> getAllReservations() async {
    await Future.delayed(Duration(milliseconds: 700));
    final response = await http.get(_baseUrl + '/reservas-sistema');

    if (response.statusCode == 200) {
      var list = (json.decode(response.body) as List)
          .map((data) => Reservation.fromJson(data))
          .toList();
      return list;
    } else {
      throw new UserException(
          'No ha sido posible obtener obtener las reservas pendientes');
    }
  }
}
