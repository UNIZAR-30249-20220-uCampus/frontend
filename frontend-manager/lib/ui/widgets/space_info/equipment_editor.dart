import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';

class EquipmentEditor extends StatefulWidget {
  final List<Equipment> equipments;
  final Function(List<Equipment>) onEquipmentsChange;

  EquipmentEditor({
    @required this.equipments,
    @required this.onEquipmentsChange,
  });

  @override
  _EquipmentEditorState createState() => _EquipmentEditorState();
}

class _EquipmentEditorState extends State<EquipmentEditor> {
  bool _adderIsActive = false;
  EquipmentKind _newEquipmentKind = EquipmentKind.NMRO_PLAZAS;
  int _newEquipmentAmount = 2;
  List<Equipment> _equipments;

  @override
  void initState() {
    super.initState();
    _equipments = widget.equipments;
  }

  @override
  Widget build(BuildContext context) {
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
                  Text('Equipamiento',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor)),
                  Text('Modifique los equipamientos del espacio'),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      numeric: true),
                  DataColumn(
                    label: Text(
                      'Tipo',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  DataColumn(label: Container()),
                ],
                rows: List.generate(_equipments.length + 1, (index) {
                  if (index == _equipments.length) {
                    return _buildEquipmentAdditionRow(
                        context, Theme.of(context).primaryColor);
                  } else {
                    return _buildEquipmentRow(
                      context,
                      _equipments[index],
                      Theme.of(context).primaryColor,
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
                setState(() {
                  _equipments.remove(equipment);
                });
                widget.onEquipmentsChange(_equipments);
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
                setState(() {
                  _adderIsActive = false;
                  _equipments.add(Equipment(
                    amount: _newEquipmentAmount,
                    equipmentKind: _newEquipmentKind,
                  ));
                });
                widget.onEquipmentsChange(_equipments);
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
                setState(() => _adderIsActive = true);
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
