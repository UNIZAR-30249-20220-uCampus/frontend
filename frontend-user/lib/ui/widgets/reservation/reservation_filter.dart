import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';

class ReservationFilter extends StatefulWidget {
  final List<ReservationStatus> reservationFilterCriteria;
  final Function(List<ReservationStatus>) onFilterSelected;

  ReservationFilter(
      {@required this.reservationFilterCriteria, this.onFilterSelected});

  @override
  _ReservationFilterState createState() => _ReservationFilterState();
}

class _ReservationFilterState extends State<ReservationFilter> {
  List<ReservationStatus> _selectedFilters;

  @override
  void initState() {
    super.initState();
    _selectedFilters = widget.reservationFilterCriteria;
  }

  String statusToLabel(ReservationStatus status) {
    switch (status) {
      case ReservationStatus.ACCEPTED:
        return 'Aceptadas';
        break;
      case ReservationStatus.REJECTED:
        return 'Rechazadas';
        break;
      case ReservationStatus.PENDING:
        return 'Pendientes';
        break;
      case ReservationStatus.PENDING_PAYMENT:
        return 'Pendientes de pago';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 100.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: GestureDetector(
                child: Chip(
                  backgroundColor: _selectedFilters.isEmpty
                      ? Theme.of(context).primaryColor
                      : Colors.grey[300],
                  label: Text('Todas',
                      style: TextStyle(
                        color: _selectedFilters.isNotEmpty
                            ? Colors.black
                            : Colors.white,
                      )),
                ),
                onTap: () {
                  List<ReservationStatus> selectedFilters = 
                      this.widget.reservationFilterCriteria;
                      selectedFilters.clear();
                  setState(() => _selectedFilters = selectedFilters);
                  this.widget.onFilterSelected(selectedFilters);
                },
              ),
            ),
            for (var status in ReservationStatus.values)
              Padding(
                padding: EdgeInsets.only(left: 10, top: 15),
                child: GestureDetector(
                  child: Chip(
                    backgroundColor: _selectedFilters.contains(status)
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                    label: Text(statusToLabel(status),
                        style: TextStyle(
                          color: !_selectedFilters.contains(status)
                              ? Colors.black
                              : Colors.white,
                        )),
                  ),
                  onTap: () {
                    List<ReservationStatus> selectedFilters = 
                    this.widget.reservationFilterCriteria;
                    if (this
                        .widget
                        .reservationFilterCriteria
                        .contains(status)) {
                      selectedFilters.remove(status);
                    } else {
                      selectedFilters.add(status);
                    }
                    setState(() => _selectedFilters = selectedFilters);
                    this.widget.onFilterSelected(selectedFilters);
                  },
                ),
              )
          ],
        ));
  }
}
