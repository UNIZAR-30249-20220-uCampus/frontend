import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/space.dart';

class FareBox extends StatelessWidget {
  final Space space;

  FareBox({@required this.space});

  @override
  Widget build(BuildContext context) {
    int numPlaces = space.equipments
        .firstWhere(
            (element) => element.equipmentKind == EquipmentKind.NMRO_PLAZAS,
            orElse: () =>
                Equipment(equipmentKind: EquipmentKind.NMRO_PLAZAS, amount: 0))
        .amount;

    int numComputers = space.equipments
        .firstWhere(
            (element) => element.equipmentKind == EquipmentKind.ORDENADORES,
            orElse: () =>
                Equipment(equipmentKind: EquipmentKind.ORDENADORES, amount: 0))
        .amount;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'x' + numPlaces.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'x' + numComputers.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'x' + space.capacity.replaceAll("\"", ""),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'plazas (3€)',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'ordenadores (3€)',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'm² (1€)',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    (numPlaces * 3).toString() + '€',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    (numComputers * 5).toString() + '€',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    space.capacity.replaceAll("\"", "") + '€',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Container(height: 10),
          Container(height: 0.75, width: double.infinity, color: Colors.black),
          Container(height: 10),
          Text(
            (numPlaces * 3 +
                        numComputers * 5 +
                        double.parse(space.capacity.replaceAll("\"", "").replaceAll(",", ".").trim()))
                    .toStringAsFixed(1) +
                ' €',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
