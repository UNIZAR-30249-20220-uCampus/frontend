import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/widgets/timetables/date_selector.dart';
import 'package:ucampus_lib/ui/widgets/timetables/timetable_display.dart';
import 'package:device_id/device_id.dart';

class ReservationInfoCard extends StatefulWidget {
  final Reservation reservation;
  final Function(int) onCancel;
  final Function(int) onAccept;
  final Function(int, Payment) onPay;
  final bool manager;

  const ReservationInfoCard(
      {Key key,
      this.reservation,
      this.onCancel,
      this.onAccept,
      this.onPay,
      this.manager})
      : super(key: key);
  @override
  _ReservationInfoCardtate createState() => _ReservationInfoCardtate();
}

class _ReservationInfoCardtate extends State<ReservationInfoCard> {
  String _deviceid = '';
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnControllerAccept =
      new RoundedLoadingButtonController();

  bool cancelEnabled = true;
  bool acceptEnabled = true;

  @override
  void initState() {
    super.initState();
    initDeviceId();
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
    void onTimetableChange(Timetable initialTimetable) {}
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: <Widget>[
              Container(height: 10),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Espacio',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(widget.reservation.space.replaceAll("\"", "")),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading:
                        Icon(Icons.menu, color: Theme.of(context).primaryColor),
                    title: Text(
                      'Horario',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                      'Franjas horarias en las que se ha reservado el espacio',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TimetableDisplay(
                      onTimetableChanged: (timetable) =>
                          onTimetableChange(timetable),
                      initialTimetable: widget.reservation.timeTable,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.today,
                        color: Theme.of(context).primaryColor),
                    title: Text(
                      'Fechas',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text('Fechas de inicio y de fin de la reserva'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: DateDisplay(
                          currentTime: widget.reservation.timeTable.startDate,
                          isEnabled: true,
                        ),
                      ),
                      Container(width: 20),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: DateDisplay(
                          currentTime: widget.reservation.timeTable.endDate,
                          isEnabled: true,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  ListTile(
                    leading:
                        Icon(Icons.loop, color: Theme.of(context).primaryColor),
                    title: Text(
                      'Frecuencia',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text('Frecuencia de repetición de la reserva'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 70, bottom: 20),
                    child: Text(
                      ' Cada ' +
                          widget.reservation.timeTable.frecuency.toString() +
                          ' semana(s)',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[900]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        Container(height: 10),
        (_deviceid == widget.reservation.userID &&
                (widget.reservation.reservationStatus ==
                    ReservationStatus.PENDIENTE) &&
                !widget.manager)
            ? Positioned(
                bottom: 50,
                right: 0,
                left: 10,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      child: RoundedLoadingButton(
                          color: Theme.of(context).primaryColor,
                          controller: _btnController,
                          child: Text(
                            'Cancelar reserva',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor),
                          ),
                          onPressed: () async {
                            widget.onCancel(widget.reservation.reservationID);
                            _btnController.success();
                            Navigator.of(context).pushReplacementNamed('/');
                          }),
                    )))
            : Container(),
        _deviceid == widget.reservation.userID &&
                (widget.reservation.reservationStatus ==
                    ReservationStatus.PENDIENTEPAGO) &&
                !widget.manager
            ? Positioned(
                bottom: 50,
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
                            'Pagar reserva',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor),
                          ),
                          onPressed: () async {
                            widget.onPay(
                                widget.reservation.reservationID, Payment());
                            _btnController.success();
                            Navigator.of(context).pushReplacementNamed('/');
                          }),
                    )))
            : Container(),
        (widget.manager &&
                (widget.reservation.reservationStatus ==
                    ReservationStatus.PENDIENTE))
            ? Positioned(
                bottom: 50,
                right: 140,
                left: 0,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 120,
                      child: RoundedLoadingButton(
                          color: Theme.of(context).primaryColor,
                          controller: _btnController,
                          child: Text(
                            'Rechazar',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor),
                          ),
                          onPressed: cancelEnabled
                              ? () async {
                                  setState(() {
                                    acceptEnabled = false;
                                  });
                                  widget.onCancel(
                                      widget.reservation.reservationID);
                                  _btnController.success();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
                                }
                              : null),
                    )))
            : Container(),
        widget.manager &&
                (widget.reservation.reservationStatus ==
                    ReservationStatus.PENDIENTE)
            ? Positioned(
                bottom: 50,
                right: 0,
                left: 140,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 120,
                      child: RoundedLoadingButton(
                          color: Theme.of(context).primaryColor,
                          controller: _btnControllerAccept,
                          child: Text(
                            'Aceptar',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor),
                          ),
                          onPressed: acceptEnabled
                              ? () async {
                                  setState(() {
                                    cancelEnabled = false;
                                  });
                                  widget.onAccept(
                                      widget.reservation.reservationID);
                                  _btnControllerAccept.success();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
                                }
                              : null),
                    )))
            : Container(),
        Container(height: 10),
      ],
    );
  }
}
