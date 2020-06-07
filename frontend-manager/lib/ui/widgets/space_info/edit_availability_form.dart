import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_selector.dart';
import 'package:device_id/device_id.dart';

class EditAvailabilityForm extends StatefulWidget {
  final Space space;
  final Function(Timetable, String, bool, String)
      onReservation;
  final bool externalUser;

  const EditAvailabilityForm(
      {Key key, this.space, this.onReservation, this.externalUser})
      : super(key: key);
  @override
  _EditAvailabilityFormState createState() => _EditAvailabilityFormState();
}

class _EditAvailabilityFormState extends State<EditAvailabilityForm> {
  Timetable _timetable;
  String _deviceid = '';
  bool showError = false;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  void onTimetableChange(Timetable initialTimetable) {
    setState(() => _timetable = initialTimetable);
  }

  Future<void> initDeviceId() async {
    String deviceid;
    deviceid = await DeviceId.getID;

    setState(() {
      _deviceid = deviceid;
    });
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
                          child: Text('Indisponibilidad de ' + widget.space.uuid,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Theme.of(context).primaryColor,
                              ))),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Horario y fechas',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                      'Selecciona las franjas horarias en las que deseas que el espacio NO esté diponible para reservar / alquilar '),
                                ],
                              ),
                            ),
                            TimetableSelector(
                              onTimetableChanged: (timetable) =>
                                  onTimetableChange(timetable),
                              isEnabled: true,
                              initialTimetable: null,
                            ),
                            showError
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: 30, left: 0, bottom: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('(Complete todos los campos)',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.redAccent,
                                            ))
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )
                      ),
                ],
              ),
            )),
        Positioned(
            bottom: 30,
            right: 10,
            left: 10,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 250,
                  child: RoundedLoadingButton(
                      color: Theme.of(context).primaryColor,
                      controller: _btnController,
                      child: Text(
                        'Guardar',
                        style: TextStyle(
                            fontSize: 15, color: Theme.of(context).accentColor),
                      ),
                      onPressed: () async {
                        if (_timetable == null ||
                            _deviceid == '') {
                          _btnController.stop();
                          setState(() {
                            showError = true;
                          });
                        } else {
                          setState(() {
                            showError = false;
                          });
                          if (widget.externalUser) {
                            var reservation = new Reservation(
                                reservationID: 1,
                                space: widget.space.uuid,
                                timeTable: _timetable,
                                reservationStatus: ReservationStatus.PENDIENTE,
                                userID: _deviceid);
                            _btnController.stop();
                            Navigator.pushReplacementNamed(
                                context, "reservation_external",
                                arguments: reservation);
                          } else { 
                            widget.onReservation(_timetable, widget.space.uuid,
                               false, _deviceid);
                            _btnController.success();
                            Navigator.pushReplacementNamed(context, "availability_confirm");
                          }
                        }
                      }),
                ))),
      ],
    );
  }
}
