import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';

class RentalForm extends StatefulWidget {
  final Space space;
  final Function(Timetable, String, bool) onRental;

  const RentalForm({Key key, this.space, this.onRental})
      : super(key: key);
  @override
  _RentalFormState createState() => _RentalFormState();
}

class _RentalFormState extends State<RentalForm> {
  String _dateStart = "-- -- ----";
  String _timeStart = "--:--";
  String _dateFinish = "-- -- ----";
  String _timeFinish = "--:--";

  List<String> frequencies = ['no', 'día', 'mes', 'año'];
  String selectedFrecuency = '';

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
                      title: Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 10, left: 10),
                          child: Text('Alquiler de ' + widget.space.uuid,
                              style: TextStyle(
                                fontSize: 30,
                              ))),
                      subtitle: Container()), // TODO
                ],
              ),
            )),
        Positioned(
            bottom: 50,
            right: 10,
            left: 10,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 250,
                  child: RoundedLoadingButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Solicitar alquiler',
                        style: TextStyle(
                            fontSize: 15, color: Theme.of(context).accentColor),
                      ),
                      onPressed: () async {
                        await Future.delayed(Duration(seconds: 2));
                        // TODO Crear correctamente Timetable
                        widget.onRental(
                            new Timetable(), widget.space.uuid, true);
                        Navigator.of(context).pop();
                      }),
                ))),
      ],
    );
  }
}
