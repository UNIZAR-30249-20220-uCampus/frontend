import 'package:ucampus/core/models/equipment.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/space.dart';

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
}
