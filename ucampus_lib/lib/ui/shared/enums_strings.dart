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
    EquipmentKind.CAYON_FIJO: 'CAYON_FIJO',
    EquipmentKind.CANYON_FIJO: 'CANYON_FIJO',
    EquipmentKind.PANTALLA_PROYECTOR: 'PANTALLA_PROYECTOR',
    EquipmentKind.EQUIPO_DE_SONIDO: 'EQUIPO_DE_SONIDO',
    EquipmentKind.TV: 'TV',
    EquipmentKind.VIDEO: 'VIDEO',
    EquipmentKind.DVD: 'DVD',
    EquipmentKind.FOTOCOPIADORAS: 'FOTOCOPIADORAS',
    EquipmentKind.IMPRESORAS: 'IMPRESORAS',
    EquipmentKind.ORDENADORES: 'ORDENADORES',
    EquipmentKind.FAXES: 'FAXES',
    EquipmentKind.TELEFONOS: 'TELEFONOS',
    EquipmentKind.PIZARRA: 'PIZARRA',
    EquipmentKind.NMRO_EXTINTORES_POLVO: 'NMRO_EXTINTORES_POLVO',
    EquipmentKind.NMRO_EXTINTORES_CO2: 'NMRO_EXTINTORES_CO2',
    EquipmentKind.NMRO_PLAZAS: 'NMRO_PLAZAS',
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

}
