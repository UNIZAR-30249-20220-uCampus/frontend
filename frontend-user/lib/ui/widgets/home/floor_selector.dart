import 'package:flutter/material.dart';

class FloorSelector extends StatelessWidget {
  final int selectedFloor;
  final Function(int) onFloorSelected;
  final bool cardShowed; 

  FloorSelector({@required this.selectedFloor, @required this.onFloorSelected, @required this.cardShowed});

  @override
  Widget build(BuildContext context) {
    List<int> floors = [4, 3, 2, 1, 0, -1];
    return Padding(
        padding: EdgeInsets.only(
          right: 10.0,
          bottom: cardShowed ? 180 : 0
        ),
        child:  Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 46.0,
          height: 216.0,
          child: Material(
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Wrap(
              spacing: 0.0,
              direction: Axis.vertical,
              children: <Widget>[
                for (var floor in floors)
                  Container(
                    width: 46,
                    child: FlatButton(
                        color: selectedFloor == floor
                            ? Theme.of(context).primaryColor
                            : null,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text(floor.toString(),
                            style: TextStyle(
                              color: selectedFloor == floor
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).primaryColor,
                            )),
                        onPressed: () => onFloorSelected(floor)),
                  ),
              ],
            ),
          ),
        ),
    ));
  }
}
