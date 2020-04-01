import 'dart:convert';
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ucampus/core/models/equipment.dart';

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
  final List<Equipment> equipments;

  Space({
    @required this.uuid,
    @required this.name,
    @required this.kind,
    @required this.capacity,
    @required this.building,
    @required this.isBookable,
    @required this.surface,
    @required this.equipments,
  });

  Space copy({
    String uuid,
    String name,
    String kind,
    int capacity,
    String building,
    bool isBookable,
    double surface,
    List<Equipment> equipments,
  }) =>
      Space(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        kind: kind ?? this.kind,
        capacity: capacity ?? this.capacity,
        building: building ?? this.building,
        isBookable: isBookable ?? this.isBookable,
        surface: surface ?? this.surface,
        equipments: equipments ?? this.equipments,
      );

  static Space randomSpace({int labNumber}) {
    final _random = Random();
    String labUUID = '1.02';
    if (labNumber != null) {
      labUUID = '1.0' + labNumber.toString();
    }
    return Space(
      uuid: 'lab-' + labUUID,
      name: 'Laboratorio ' + labUUID,
      kind: 'Laboratorio',
      capacity: _random.nextInt(100) + 5,
      building: 'Edif. Ada Byron',
      isBookable: true,
      surface: _random.nextDouble() * 100.0,
      equipments: List.generate(
        _random.nextInt(4),
        (index) => Equipment.randomEquipment(),
      ),
    );
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
            this.name == other.name &&
            this.kind == other.kind &&
            this.capacity == other.capacity &&
            this.building == other.building &&
            this.isBookable == other.isBookable &&
            this.surface == other.surface &&
            this.equipments == other.equipments);
  }

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceToJson(this);
}
