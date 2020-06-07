import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/ui/shared/enums_strings.dart';
import 'package:ucampus_lib/ui/widgets/space_info/mini_map.dart';

class SpaceInfoCard extends StatelessWidget {
  final Space space;

  SpaceInfoCard({
    @required this.space,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> details = [
      ListTile(
        title: Text(
          space.name,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor),
        ),
        //subtitle: Text(EnumsStrings.spaceKind[space.kind]),
      ),
      buildDetailsItem(
        context,
        Icons.info_outline,
        space.uuid.replaceAll("\"", ""),
      ),
      buildDetailsItem(
        context,
        Icons.photo_size_select_small,
        space.capacity.replaceAll("\"", "") + ' m²',
      ),
      buildDetailsItem(
        context,
        Icons.account_balance,
        EnumsStrings.building[space.building],
      ),
      buildDetailsItem(
        context,
        Icons.developer_board,
        'Equipamiento',
        body: buildEquipmentTable(),
      ),
      buildDetailsItem(
        context,
        Icons.location_on,
        'Ubicación',
        body: Container(height: 200, child: MiniMap(space: this.space)),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (_, index) => details[index],
            separatorBuilder: (_, __) => Divider(),
            itemCount: details.length,
          ),
        ),
      ],
    );
  }

  Padding buildEquipmentTable() {
    List<Equipment> cleanEquipments =
        space.equipments.where((equipment) => equipment.amount > 0).toList()..sort((a, b) => a.amount > b.amount ? -1 : 1);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
      child: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: DataTable(
            columnSpacing: 30,
            columns: <DataColumn>[
              DataColumn(
                  label: Text(
                    'Cantidad',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  numeric: true),
              DataColumn(
                label: Text(
                  'Tipo',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
            rows: List.generate(
              cleanEquipments.length,
              (index) => DataRow(
                cells: [
                  DataCell(
                      Text('x ' + cleanEquipments[index].amount.toString())),
                  DataCell(Text(EnumsStrings
                      .equipmentKind[cleanEquipments[index].equipmentKind]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailsItem(BuildContext context, IconData icon, String value,
      {Widget body}) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(value),
        ),
        body ?? Container()
      ],
    );
  }
}
