import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ucampus/core/models/equipment.dart';

part 'filter_criteria.g.dart';

enum CriteriaKind {
  NAME,
  KIND,
  EQUIPMENT,
  CAPACITY,
  SURFACE,
  TIMETABLE,
}

@JsonSerializable()
class FilterCriteria {
  final List<CriteriaKind> activeCriteria;
  final String name;
  final String kind;
  final List<Equipment> equipments;
  final int capacity;
  final double surface;
  //TODO: considerar Timetable

  FilterCriteria({
    @required this.activeCriteria,
    @required this.name,
    @required this.kind,
    @required this.equipments,
    @required this.capacity,
    @required this.surface,
  });

  FilterCriteria copy({
    List<CriteriaKind> activeCriteria,
    String name,
    String kind,
    List<Equipment> equipments,
    int capacity,
    double surface,
  }) =>
      FilterCriteria(
        activeCriteria: activeCriteria ?? this.activeCriteria,
        name: name ?? this.name,
        kind: kind ?? this.kind,
        equipments: equipments ?? this.equipments,
        capacity: capacity ?? this.capacity,
        surface: surface ?? this.surface,
      );

  static FilterCriteria cleanCritera() => FilterCriteria(
        activeCriteria: [],
        name: null,
        kind: null,
        equipments: null,
        capacity: null,
        surface: null,
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
            this.kind == other.kind &&
            this.equipments == other.equipments &&
            this.capacity == other.capacity &&
            this.surface == other.surface);
  }

  @override
  int get hashCode =>
      this.activeCriteria.hashCode ^
      this.name.hashCode ^
      this.kind.hashCode ^
      this.equipments.hashCode ^
      this.capacity.hashCode ^
      this.surface.hashCode;

  factory FilterCriteria.fromJson(Map<String, dynamic> json) =>
      _$FilterCriteriaFromJson(json);
  Map<String, dynamic> toJson() => _$FilterCriteriaToJson(this);
}
