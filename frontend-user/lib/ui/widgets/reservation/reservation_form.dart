import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_selector.dart';
import 'package:device_id/device_id.dart';

class ReservationForm extends StatefulWidget {
  final Space space;
  final Function(Timetable, String, bool, String) onReservation;
  final bool externalUser;

  const ReservationForm(
      {Key key, this.space, this.onReservation, this.externalUser})
      : super(key: key);
  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
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
    bool isBookable = widget.externalUser && !widget.space.isLeasable;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    widget.space.uuid.replaceAll("\"", ""),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.account_balance,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    EnumsStrings.building[widget.space.building],
                  ),
                ),
                Divider(),
                isBookable
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 0, bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(height: 30),
                                Icon(
                                  Icons.receipt,
                                  size: 80,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Container(height: 30),
                                Text(
                                  'Este espacio no puede ser alquilado',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20),
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
                                    'Selecciona las franjas horarias en las que deseas reservar el espacio y las fechas de inicio y fin'),
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
                                      Text(
                                        '(Complete todos los campos)',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.redAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      )
              ],
            ),
          ),
        ),
        isBookable ? Container() : Divider(),
        isBookable
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: RoundedLoadingButton(
                  color: Theme.of(context).primaryColor,
                  controller: _btnController,
                  child: Text(
                    widget.externalUser && widget.space.isLeasable
                        ? 'Siguiente'
                        : 'Solicitar reserva',
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).accentColor),
                  ),
                  onPressed: () async {
                    if (_timetable == null || _deviceid == '') {
                      _btnController.stop();
                      setState(() {
                        showError = true;
                      });
                    } else {
                      setState(() {
                        showError = false;
                      });
                      if (widget.externalUser && widget.space.isLeasable) {
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
                        widget.onReservation(
                            _timetable, widget.space.uuid, false, _deviceid);
                        _btnController.success();
                        Navigator.of(context).pop();
                      }
                    }
                  },
                ),
              ),
      ],
    );
  }
}
