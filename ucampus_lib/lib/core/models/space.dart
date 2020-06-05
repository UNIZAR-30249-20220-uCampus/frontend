import 'dart:convert';
import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:utm/utm.dart';

part 'space.g.dart';


enum SpaceKind {
  WAREHOUSE,
  CLASSROOM,
  TOILET,
  LIBRARY,
  CAFETERIA,
  OFFICE,
  LABORATORY,
  CORRIDOR,
}

@JsonSerializable()
class Space {
  @JsonKey(name: 'id_espacio')
  final String uuid;
  @JsonKey(name: 'id_utc')
  final String name;
  final SpaceKind kind;
  @JsonKey(name: 'superficie')
  final String capacity;
  @JsonKey(name: 'id_edificio')
  final String building;
  @JsonKey(name: 'alquilable')
  final bool isBookable;
  @JsonKey(name: 'equipamientos')
  final List<Equipment> equipments;
  @JsonKey(name: 'lat_center')
  final double lat;
  @JsonKey(name: 'lng_center')
  final double long;

  Space({
    @required this.uuid,
    @required this.name,
    this.kind,
    @required this.capacity,
    @required this.building,
    @required this.isBookable,
    @required this.equipments,
    this.lat,
    this.long,
  });

  Space copy({
    String uuid,
    String name,
    String kind,
    String capacity,
    String building,
    bool isBookable,
    List<Equipment> equipments,
    double lat,
    double long,
  }) =>
      Space(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        kind: kind ?? this.kind,
        capacity: capacity ?? this.capacity,
        building: building ?? this.building,
        isBookable: isBookable ?? this.isBookable,
        equipments: equipments ?? this.equipments,
        lat: lat ?? this.lat,
        long: long ?? this.long
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
      kind: SpaceKind.LABORATORY,
      capacity: "100.0",
      building: 'Edif. Ada Byron',
      isBookable: true,
      lat: 41.683252,
      long:  -0.887632,
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
            this.lat == other.lat &&
            this.long == other.long &&
            this.equipments == other.equipments);
  }

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceToJson(this);
}
