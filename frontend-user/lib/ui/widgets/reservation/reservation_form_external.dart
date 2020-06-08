import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus/ui/widgets/reservation/fare_box.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';

class ReservationFormExternal extends StatefulWidget {
  final Reservation reservation;
  final Function(Timetable, String, bool, String) onReservation;

  const ReservationFormExternal({Key key, this.reservation, this.onReservation})
      : super(key: key);
  @override
  _ReservationFormExternalState createState() =>
      _ReservationFormExternalState();
}

class _ReservationFormExternalState extends State<ReservationFormExternal> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  widget.reservation.space.replaceAll("\"", ""),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  EnumsStrings.building[widget.reservation.spaceData.building],
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.payment,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Tarifa de alquiler',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                    'A continuación, se presenta la tarifa por hora de alquiler del espacio'),
              ),
              Container(height: 30),
              FareBox(
                space: widget.reservation.spaceData,
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: RoundedLoadingButton(
              color: Theme.of(context).primaryColor,
              controller: _btnController,
              child: Text(
                'Solicitar reserva',
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).accentColor),
              ),
              onPressed: () async {
                widget.onReservation(widget.reservation.timeTable,
                    widget.reservation.space, true, widget.reservation.userID);

                _btnController.success();
                Navigator.of(context).pushReplacementNamed("/");
              }),
        )
      ],
    );
  }
}
