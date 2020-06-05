import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'slot.g.dart';

enum Weekday {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

@JsonSerializable()
class Slot {
  @JsonKey(name: 'diaSemana')
  final Weekday weekday;
  @JsonKey(name: 'slotInicio')
  final int startingSlotNumber;
  @JsonKey(name: 'slotFinal')
  final int endingSlotNumber;

  Slot(
      {@required this.weekday,
      @required this.startingSlotNumber,
      @required this.endingSlotNumber});

  Slot copy({
    Weekday weekday,
    int startingSlotNumber,
    int endingSlotNumber,
  }) {
    return Slot(
      weekday: weekday ?? this.weekday,
      startingSlotNumber: startingSlotNumber ?? this.startingSlotNumber,
      endingSlotNumber: endingSlotNumber ?? this.endingSlotNumber,
    );
  }

  @override
  int get hashCode =>
      this.weekday.hashCode ^
      this.startingSlotNumber.hashCode ^
      this.endingSlotNumber.hashCode;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
  Map<String, dynamic> toJson() => _$SlotToJson(this);

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is Slot &&
            this.weekday == other.weekday &&
            this.startingSlotNumber == other.startingSlotNumber &&
            this.endingSlotNumber == other.endingSlotNumber);
  }
}
