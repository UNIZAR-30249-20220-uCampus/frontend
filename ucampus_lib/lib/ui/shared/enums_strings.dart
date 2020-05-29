import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/slot.dart';
import 'package:ucampus_lib/core/models/space.dart';

class EnumsStrings {
  static const Map<SpaceKind, String> spaceKind = {
    SpaceKind.WAREHOUSE: 'Almacén',
    SpaceKind.CLASSROOM: 'Aula',
    SpaceKind.TOILET: 'Baño',
    SpaceKind.LIBRARY: 'Biblioteca',
    SpaceKind.CAFETERIA: 'Cafetería',
    SpaceKind.OFFICE: 'Despacho',
    SpaceKind.LABORATORY: 'Laboratorio',
    SpaceKind.CORRIDOR: 'Pasillo',
  };

  static const Map<EquipmentKind, String> equipmentKind = {
    EquipmentKind.BOARD: 'Pizarra',
    EquipmentKind.CHAIR: 'Silla',
    EquipmentKind.COMPUTER: 'Ordenador',
    EquipmentKind.PROJECTOR: 'Proyector',
    EquipmentKind.TABLE: 'Mesa'
  };

  static const Map<CriteriaKind, String> criteriaKind = {
    CriteriaKind.NAME : 'Nombre',
    CriteriaKind.CAPACITY : 'Aforo',
    CriteriaKind.KIND : 'Tipo de espacio',
    CriteriaKind.EQUIPMENT : 'Equipamiento',
    CriteriaKind.TIMETABLE : 'Disponibilidad',
  };

  static const Map<Weekday, String> weekday = {
    Weekday.MONDAY : 'Lunes',
    Weekday.TUESDAY : 'Martes',
    Weekday.WEDNESDAY : 'Miércoles',
    Weekday.THURSDAY : 'Jueves',
    Weekday.FRIDAY : 'Viernes',
    Weekday.SATURDAY : 'Sábado',
    Weekday.SUNDAY : 'Domingo',
  };

  static const Map<ReservationFrequency, String> reservationFrequency = {
    ReservationFrequency.NO : 'No',
    ReservationFrequency.WEEKLY: 'Semana',
    ReservationFrequency.MONTHLY: 'Mes',
    ReservationFrequency.ANNUALLY: 'Año',
  };
}
