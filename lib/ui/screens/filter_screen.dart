import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ucampus/core/redux/connectors/filter/capacity_filter.dart';
import 'package:ucampus/core/redux/connectors/filter/equipment_filter.dart';
import 'package:ucampus/core/redux/connectors/filter/space_kind_filter.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar espacios'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  CapacityFilterConnector(),
                  SpaceKindFilterConnector(),
                  EquipmentFilterConnector(),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedLoadingButton(
                color: Theme.of(context).primaryColor,
                child: Text('Ver resultados',
                    style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }
}
