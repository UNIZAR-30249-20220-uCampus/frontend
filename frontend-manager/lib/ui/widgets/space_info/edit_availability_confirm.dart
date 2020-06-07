import 'package:flutter/material.dart';

class EditAvailabilityConfirm extends StatefulWidget {
  const EditAvailabilityConfirm({Key key}) : super(key: key);
  @override
  _EditAvailabilityConfirmState createState() =>
      _EditAvailabilityConfirmState();
}

class _EditAvailabilityConfirmState extends State<EditAvailabilityConfirm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 10,
            right: 10,
            left: 10,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      subtitle: Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 0, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Petición pendiente',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                    'La petitición en las franjas seleccionadas está en estado PENDIENTE. '),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                    'Para que se haga efectiva, debe acceder a las reservas pendientes del espacio y ACEPTARLA.'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30, left: 110),
                                child: Icon(
                                  Icons.timer,
                                  color: Theme.of(context).primaryColor,
                                  size: 100.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            )),
      ],
    );
  }
}
