import 'package:flutter/material.dart';
import 'package:ucampus/core/models/timetable.dart';

class ReservationButton extends StatelessWidget {
  final Function(Timetable, String, bool) onReservation;

  ReservationButton({
    @required this.onReservation,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: 250,
            child: FloatingActionButton.extended(
              onPressed: () {
                onReservation(new Timetable(), 'id1', false);
              },
              label: Text(
                'Solicitar reserva',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              // icon: Icon(Icons.r),
              backgroundColor: Theme.of(context).primaryColor,
            )));
  }
}
