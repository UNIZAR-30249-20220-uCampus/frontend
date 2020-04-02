import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ucampus/core/models/equipment.dart';
import 'package:ucampus/core/models/space.dart';

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
  final List<CriteriaKind> activeCriteria;
  final String name;
  final List<SpaceKind> kinds;
  final List<Equipment> equipments;
  final int capacity;
  //TODO: considerar Timetable

  FilterCriteria({
    @required this.activeCriteria,
    @required this.name,
    @required this.kinds,
    @required this.equipments,
    @required this.capacity,
  });

  FilterCriteria copy({
    List<CriteriaKind> activeCriteria,
    String name,
    List<SpaceKind> kinds,
    List<Equipment> equipments,
    int capacity,
  }) =>
      FilterCriteria(
        activeCriteria: activeCriteria ?? this.activeCriteria,
        name: name ?? this.name,
        kinds: kinds ?? this.kinds,
        equipments: equipments ?? this.equipments,
        capacity: capacity ?? this.capacity,
      );

  static FilterCriteria cleanCritera() => FilterCriteria(
        activeCriteria: [],
        name: '',
        kinds: [],
        equipments: [],
        capacity: 30,
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
            this.equipments == other.equipments &&
            this.capacity == other.capacity);
  }

  @override
  int get hashCode =>
      this.activeCriteria.hashCode ^
      this.name.hashCode ^
      this.kinds.hashCode ^
      this.equipments.hashCode ^
      this.capacity.hashCode;

  factory FilterCriteria.fromJson(Map<String, dynamic> json) =>
      _$FilterCriteriaFromJson(json);
  Map<String, dynamic> toJson() => _$FilterCriteriaToJson(this);
}
