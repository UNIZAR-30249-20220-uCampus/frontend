import 'package:flutter/material.dart';
import 'package:ucampus/core/models/slot.dart';
import 'package:ucampus/ui/shared/enums_strings.dart';
import 'package:ucampus/ui/shared/string_utils.dart';

class SlotSelector extends StatefulWidget {
  final Weekday weekday;
  final int startingSlot;
  final int endingSlot;
  final Function onDeleted;
  final Function(int, int) onChanged;
  final bool isEnabled;

  SlotSelector({
    @required this.weekday,
    @required this.startingSlot,
    @required this.endingSlot,
    @required this.onDeleted,
    @required this.onChanged,
    @required this.isEnabled,
  });

  @override
  _SlotSelectorState createState() => _SlotSelectorState();
}

class _SlotSelectorState extends State<SlotSelector> {
  int _startingTime;
  int _endingTime;

  @override
  void initState() {
    super.initState();
    _startingTime = widget.startingSlot;
    _endingTime = widget.endingSlot;
  }

  @override
  void didUpdateWidget(SlotSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    _startingTime = widget.startingSlot;
    _endingTime = widget.endingSlot;
  }

  @override
  Widget build(BuildContext context) {
    Color _featuredColor =
        this.widget.isEnabled ? Theme.of(context).primaryColor : Colors.grey;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                EnumsStrings.weekday[this.widget.weekday] + ' - ',
                style: TextStyle(
                    color: _featuredColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(StringUtils.slotLengthToString(_endingTime - _startingTime),
                  style: TextStyle(fontStyle: FontStyle.italic)),
              Expanded(child: Container()),
              IconButton(
                icon: Icon(Icons.close, color: _featuredColor),
                onPressed: () {
                  if (this.widget.isEnabled) {
                    widget.onDeleted();
                  }
                },
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 60,
                child: Text(StringUtils.slotNumberToTimeString(_startingTime),
                    style: TextStyle(fontSize: 17)),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                      rangeThumbShape:
                          RoundRangeSliderThumbShape(enabledThumbRadius: 7)),
                  child: RangeSlider(
                    onChanged: this.widget.isEnabled
                        ? (range) {
                            if (range.end != range.start) {
                              setState(() {
                                _startingTime = range.start.toInt();
                                _endingTime = range.end.toInt();
                              });
                            }
                          }
                        : null,
                    onChangeEnd: (range) {
                      this.widget.onChanged(_startingTime, _endingTime);
                    },
                    values: RangeValues(
                        _startingTime.toDouble(), _endingTime.toDouble()),
                    min: 6.0 * 2,
                    max: 23.0 * 2,
                    divisions: (23 - 6) * 2,
                  ),
                ),
              ),
              Container(
                width: 60,
                child: Text(StringUtils.slotNumberToTimeString(_endingTime),
                    style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
