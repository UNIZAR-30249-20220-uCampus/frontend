import 'package:flutter/material.dart';
import 'package:ucampus/data/espacio.dart';

Widget buildSpaceCarouselItem(BuildContext context, Espacio espacio) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, top: 10),
    child: Card(
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context, "/space_info",
                arguments: {"espacio": espacio});
          },
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
                        child: Text(espacio.id,
                            style: TextStyle(
                              fontSize: 25,
                            ))),
                    subtitle: Padding(
                      padding: EdgeInsets.only(bottom: 0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Edificio: ' + espacio.edicio),
                          Text('Aforo: ' + espacio.aforo.toString()),
                        ],
                      ),
                    )),
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        child: const Text('RESERVAR'),
                        onPressed: () {
                          Navigator.pushNamed(context, "/reservation",
                              arguments: {"espacio": espacio});
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}
