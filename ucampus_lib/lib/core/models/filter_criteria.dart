import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';

part 'filter_criteria.g.dart';

enum CriteriaKind {
  NAME,
  KIND,
  EQUIPMENT,
  CAPACITY,
  TIMETABLE,
}

@JsonSerializable()
class FilterCriteria {
  @JsonKey(name: 'filtrosActivos')
  final List<CriteriaKind> activeCriteria;
  @JsonKey(name: 'nombre')
  final String name;
  final List<SpaceKind> kinds;
  @JsonKey(name: 'equipamientos')
  final List<Equipment> equipments;
  @JsonKey(name: 'aforo')
  final int capacity;
  @JsonKey(name: 'horarioRequest')
  final Timetable timetable;

  FilterCriteria({
    @required this.activeCriteria,
    @required this.name,
    this.kinds,
    @required this.equipments,
    @required this.capacity,
    @required this.timetable,
  });

  FilterCriteria copy({
    List<CriteriaKind> activeCriteria,
    String name,
    List<SpaceKind> kinds,
    List<Equipment> equipments,
    int capacity,
    Timetable timetable,
  }) =>
      FilterCriteria(
        activeCriteria: activeCriteria ?? this.activeCriteria,
        name: name ?? this.name,
        kinds: kinds ?? this.kinds,
        equipments: equipments ?? this.equipments,
        capacity: capacity ?? this.capacity,
        timetable: timetable ?? this.timetable,
      );

  static FilterCriteria cleanCritera() => FilterCriteria(
        activeCriteria: [],
        name: '',
        kinds: [],
        equipments: [],
        capacity: 30,
        timetable: Timetable(),
      );

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is FilterCriteria &&
            listEquals(this.activeCriteria, other.activeCriteria) &&
            this.name == other.name &&
            listEquals(this.kinds, other.kinds) &&
            listEquals(this.equipments, other.equipments) &&
            this.capacity == other.capacity &&
            this.timetable == other.timetable);
  }

  @override
  int get hashCode =>
      this.activeCriteria.hashCode ^
      this.name.hashCode ^
      this.kinds.hashCode ^
      this.equipments.hashCode ^
      this.capacity.hashCode ^
      this.timetable.hashCode;

  factory FilterCriteria.fromJson(Map<String, dynamic> json) =>
      _$FilterCriteriaFromJson(json);
  Map<String, dynamic> toJson() => _$FilterCriteriaToJson(this);
}
