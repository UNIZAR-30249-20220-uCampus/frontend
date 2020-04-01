import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/ui/widgets/space_info/space_info_card.dart';

class RentalScreen extends StatelessWidget {
  final Space space;

  RentalScreen({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alquilar espacio'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 10, right: 10, left: 10, child: SpaceInfoCard(space: space)),
        ],
      ),
    );
  }
}