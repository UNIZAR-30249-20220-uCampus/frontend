import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/space_screen_args.dart';

class ReservationRentalDial extends StatelessWidget {
  final Space space;
  final bool isExternal;

  ReservationRentalDial({
    @required this.space,
    @required this.isExternal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600.0,
        child: SpeedDial(
          animatedIcon: AnimatedIcons.event_add,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayOpacity: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).accentColor,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Center(
                child: Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              label: isExternal? 'Alquilar':'Reservar',
              backgroundColor: Theme.of(context).accentColor,
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.pushNamed(context, "reservation", arguments: new SpaceScreenArguments(space, isExternal));
              },
            ),
          ],
        ));
  }
}
