import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ucampus/data/espacio.dart';

class SpaceInfoScreen extends StatelessWidget {
  Widget _buildSpeedDial(BuildContext context, Espacio espacio) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: SizedBox(
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
                      Icons.euro_symbol,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  label: 'Alquilar',
                  backgroundColor: Theme.of(context).accentColor,
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    Navigator.pushNamed(context, "/rental",
                        arguments: {"espacio": espacio});
                  },
                ),
                SpeedDialChild(
                  child: Center(
                    child: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  label: 'Reservar',
                  backgroundColor: Theme.of(context).accentColor,
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    Navigator.pushNamed(context, "/reservation",
                        arguments: {"espacio": espacio});
                  },
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    Espacio espacio = rcvdData['espacio'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Datos del espacio'),
        ),
        body: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(children: <Widget>[
              Positioned(
                  top: 10,
                  right: 10,
                  left: 10,
                  child: Card(
                      child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            title: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 10),
                                child: Text(espacio.id,
                                    style: TextStyle(
                                      fontSize: 28,
                                    ))),
                            subtitle: Padding(
                              padding: EdgeInsets.only(bottom: 20, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text('Edificio ' + espacio.edicio,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                          'Aforo: ' + espacio.aforo.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                          'Equipamiento: ' +
                                              espacio.equipamiento,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ))),
              Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Column(children: <Widget>[
                    Row(
                      //ROW 1
                      children: [
                        Container(
                            child:
                                new Flexible(child: _buildSpeedDial(context, espacio))),
                      ],
                    ),
                  ])),
            ])));
  }
}
