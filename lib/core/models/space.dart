import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'space.g.dart';

@JsonSerializable()
class Space {
  final String uuid;
  final String name;
  final String kind;
  final int capacity;
  final String building;
  final bool isBookable;
  final double surface;

  Space({
    @required this.uuid,
    @required this.name,
    @required this.kind,
    @required this.capacity,
    @required this.building,
    @required this.isBookable,
    @required this.surface,
  });

  Space copy({
    String uuid,
    String name,
    String kind,
    int capacity,
    String building,
    bool isBookable,
    double surface,
  }) {
    return Space(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        kind: kind ?? this.kind,
        capacity: capacity ?? this.capacity,
        building: building ?? this.building,
        isBookable: isBookable ?? this.isBookable,
        surface: surface ?? this.surface);
  }

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode => this.uuid.hashCode ^ this.name.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Space &&
            this.uuid == other.uuid &&
            this.name == other.uuid &&
            this.kind == other.kind &&
            this.capacity == other.capacity &&
            this.building == other.building &&
            this.isBookable == other.isBookable &&
            this.surface == other.surface);
  }

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceToJson(this);
}
