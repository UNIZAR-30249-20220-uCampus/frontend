import 'package:flutter/material.dart';

class NoReservations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.today,
            color: Theme.of(context).primaryColor,
            size: 70,
          ),
          Container(height: 30),
          Text(
            'Actualmente no hay\nreservas pendientes',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
