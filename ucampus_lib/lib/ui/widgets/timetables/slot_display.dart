import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/slot.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/shared/string_utils.dart';

class SlotDisplay extends StatelessWidget {
  final Weekday weekday;
  final int startingSlot;
  final int endingSlot;

  SlotDisplay({
    @required this.weekday,
    @required this.startingSlot,
    @required this.endingSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Text(
                    EnumsStrings.weekday[weekday] + ' - ',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                      StringUtils.slotLengthToString(endingSlot - startingSlot),
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  Expanded(child: Container()),
                ],
              )),
          Row(
            children: [
              Container(
                width: 60,
                child: Text(StringUtils.slotNumberToTimeString(startingSlot),
                    style: TextStyle(fontSize: 17)),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                      disabledActiveTrackColor: Theme.of(context).primaryColor,
                      disabledThumbColor: Theme.of(context).primaryColor,
                      rangeThumbShape:
                          RoundRangeSliderThumbShape(enabledThumbRadius: 2)),
                  child: RangeSlider(
                    onChanged: null,
                    onChangeEnd: null,
                    values: RangeValues(
                        startingSlot.toDouble(), endingSlot.toDouble()),
                    min: 6.0 * 2,
                    max: 23.0 * 2,
                    divisions: (23 - 6) * 2,
                  ),
                ),
              ),
              Container(
                width: 60,
                child: Text(StringUtils.slotNumberToTimeString(endingSlot),
                    style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
