import 'dart:convert';
import 'dart:math';

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment.g.dart';

enum EquipmentKind { TABLE, CHAIR, COMPUTER, PROJECTOR, BOARD }

@JsonSerializable()
class Equipment {
  final EquipmentKind equipmentKind;
  final int amount;

  Equipment({@required this.equipmentKind, @required this.amount});

  Equipment copy({EquipmentKind eqipmentKind, int amount}) {
    return Equipment(
      equipmentKind: equipmentKind ?? this.equipmentKind,
      amount: amount ?? this.amount,
    );
  }

  static Equipment randomEquipment() {
    final _random = Random();
    return Equipment(
        equipmentKind:
            EquipmentKind.values[_random.nextInt(EquipmentKind.values.length)],
        amount: _random.nextInt(9) + 1);
  }

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  @override
  int get hashCode => this.equipmentKind.hashCode ^ this.amount.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Equipment &&
            this.equipmentKind == other.equipmentKind &&
            this.amount == other.amount);
  }

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
