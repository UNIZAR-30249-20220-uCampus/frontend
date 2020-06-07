import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
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
    EquipmentKind.CAYON_FIJO: 'Cañon fijo',
    EquipmentKind.CANYON_FIJO: 'Cañón fijo',
    EquipmentKind.PANTALLA_PROYECTOR: 'Pantalla',
    EquipmentKind.EQUIPO_DE_SONIDO: 'Equipo sonido',
    EquipmentKind.TV: 'Televisión',
    EquipmentKind.VIDEO: 'Vídeo',
    EquipmentKind.DVD: 'DVD',
    EquipmentKind.FOTOCOPIADORAS: 'Fotocopiadora',
    EquipmentKind.IMPRESORAS: 'Impresora',
    EquipmentKind.ORDENADORES: 'Ordenador',
    EquipmentKind.FAXES: 'Fax',
    EquipmentKind.TELEFONOS: 'Teléfono',
    EquipmentKind.PIZARRA: 'Pizarra',
    EquipmentKind.NMRO_EXTINTORES_POLVO: 'Extintor polvo',
    EquipmentKind.NMRO_EXTINTORES_CO2: 'Extintor CO2',
    EquipmentKind.NMRO_PLAZAS: 'Sillas',
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

  static const Map<String, String> building = {
    "\"CRE.1200.\"" : "Edif. Ada Byron",
    "\"CRE.1065.\"" : "Edif. Torres Quevedo",
    "\"CRE.1201.\"" : "Edif. Betancourt",
  };

}
