import 'package:flutter/material.dart';
import 'package:ucampus/core/models/equipment.dart';

class EquipmentFilter extends StatefulWidget {
  final Function onFilterAdded;
  final Function onFilterRemoved;
  final Function(List<Equipment>) onFilterSelectionSet;
  final bool isEnabled;
  final List<Equipment> selectedEquipments;

  EquipmentFilter({
    @required this.onFilterAdded,
    @required this.onFilterRemoved,
    @required this.onFilterSelectionSet,
    @required this.isEnabled,
    @required this.selectedEquipments,
  });

  @override
  _EquipmentFilterState createState() => _EquipmentFilterState();
}

class _EquipmentFilterState extends State<EquipmentFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Equipamiento',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
              Text(
                  'Selecciona los equipamientos que quieras añadir a la búsqueda'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: true,//this.widget.isEnabled,
                    onChanged: (value) {
                      if (value) {
                        this.widget.onFilterAdded();
                      } else {
                        this.widget.onFilterRemoved();
                      }
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: DataTable(
                            columns: <DataColumn>[
                              DataColumn(label: Text('Tipo')),
                              DataColumn(label: Text('Cantidad'))
                            ],
                            rows: <DataRow>[
                              DataRow(cells: [
                                DataCell(Text('Mesa')),
                                DataCell(Text('3'))
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Silla')),
                                DataCell(Text('7'))
                              ])                              
                            ],
                          ))),
                ],
              ),
              Divider(),
              Container(height: 10)
            ],
          ),
        ),
      ],
    );
  }
}
