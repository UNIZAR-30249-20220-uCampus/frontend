import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';

class SpaceInfoCard extends StatelessWidget {
  final Space space;

  SpaceInfoCard({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                  child: Text(space.uuid,
                      style: TextStyle(
                        fontSize: 30,
                      ))),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text('Nombre: ' + space.name,
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text('Tipo: ' + space.kind,
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text('Aforo: ' + space.capacity.toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text('Edificio: ' + space.building,
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text('Superficie: ' + space.surface.toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text('Equipamiento: ',
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    for (var equipment in space.equipments)
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 10, left: 30),
                                  child: Text(
                                      'Tipo: ' +
                                          equipment.equipmentKind.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ))),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 30, bottom: 5),
                                  child: Text(
                                      'Cantidad: ' +
                                          equipment.amount.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ))),
                            ],
                          )
                        ],
                      )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
