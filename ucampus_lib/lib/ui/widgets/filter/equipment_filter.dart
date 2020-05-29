import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';

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
  bool _adderIsActive = false;
  EquipmentKind _newEquipmentKind = EquipmentKind.CHAIR;
  int _newEquipmentAmount = 2;

  @override
  Widget build(BuildContext context) {
    Color highlightColor =
        widget.isEnabled ? Theme.of(context).primaryColor : Colors.grey;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
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
                        color: this.widget.isEnabled
                        ? Theme.of(context).primaryColor
                        : Colors.grey),
                  ),
                  Text(
                      'Selecciona los equipamientos que quieras añadir a la búsqueda'),
                ],
              ),
            ),
            Switch(
              value: this.widget.isEnabled,
              onChanged: (value) {
                if (value) {
                  this.widget.onFilterAdded();
                } else {
                  setState(() => _adderIsActive = false);
                  this.widget.onFilterRemoved();
                }
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: LayoutBuilder(
            builder: (context, constraints) => ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                columnSpacing: 30,
                columns: <DataColumn>[
                  DataColumn(
                      label: Text(
                        'Cantidad',
                        style: TextStyle(
                            color: highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      numeric: true),
                  DataColumn(
                    label: Text(
                      'Tipo',
                      style: TextStyle(
                          color: highlightColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  DataColumn(label: Container()),
                ],
                rows:
                    List.generate(widget.selectedEquipments.length + 1, (index) {
                  if (index == widget.selectedEquipments.length) {
                    return _buildEquipmentAdditionRow(context, highlightColor);
                  } else {
                    return _buildEquipmentRow(
                      context,
                      widget.selectedEquipments[index],
                      highlightColor,
                    );
                  }
                }),
              ),
            ),
          ),
        ),
        Container(height: 10),
        Divider(),
        Container(height: 10)
      ],
    );
  }

  DataRow _buildEquipmentRow(
      BuildContext context, Equipment equipment, Color highlightColor) {
    return DataRow(
      cells: [
        DataCell(Text('x ' + equipment.amount.toString())),
        DataCell(Text(EnumsStrings.equipmentKind[equipment.equipmentKind])),
        DataCell(
          IconButton(
              icon: Icon(Icons.delete_forever, color: highlightColor),
              onPressed: () {
                if (widget.isEnabled) {
                  widget.onFilterSelectionSet(
                      widget.selectedEquipments..remove(equipment));
                  setState(() {}); //Chapucilla para que refresque
                }
              }),
        ),
      ],
    );
  }

  DataRow _buildEquipmentAdditionRow(
      BuildContext context, Color highlightColor) {
    if (_adderIsActive) {
      return DataRow(
        selected: true,
        cells: [
          DataCell(
            GestureDetector(
              onTap: () => _showPickerModal(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: highlightColor,
                    size: 17,
                  ),
                  Text(
                    ' x ' + _newEquipmentAmount.toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          DataCell(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<EquipmentKind>(
                items: EquipmentKind.values.map((EquipmentKind value) {
                  return DropdownMenuItem<EquipmentKind>(
                    value: value,
                    child: Text(EnumsStrings.equipmentKind[value]),
                  );
                }).toList(),
                onChanged: (kind) => setState(() => _newEquipmentKind = kind),
                value: _newEquipmentKind,
              ),
            ),
          ),
          DataCell(IconButton(
              icon: Icon(Icons.check, color: highlightColor),
              onPressed: () {
                widget.onFilterSelectionSet(widget.selectedEquipments
                  ..add(Equipment(
                    amount: _newEquipmentAmount,
                    equipmentKind: _newEquipmentKind,
                  )));
                setState(() => _adderIsActive = false);
              })),
        ],
      );
    } else {
      return DataRow(
        cells: [
          DataCell(Text('')),
          DataCell(Text('')),
          DataCell(IconButton(
              icon: Icon(Icons.add, color: highlightColor),
              onPressed: () {
                if (widget.isEnabled) {
                  setState(() => _adderIsActive = true);
                }
              })),
        ],
      );
    }
  }

  void _showPickerModal(BuildContext context) {
    Picker(
      selecteds: [_newEquipmentAmount],
      cancelText: '',
      textScaleFactor: 1.1,
      confirmText: 'Confirmar',
      adapter: PickerDataAdapter<int>(
        pickerdata: List.generate(39, (index) => index + 1),
      ),
      changeToFirst: true,
      onConfirm: (_, List value) =>
          setState(() => _newEquipmentAmount = value.first + 1),
    ).showModal(context);
  }
}
