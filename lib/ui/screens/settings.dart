import 'package:flutter/material.dart';
import 'package:ucampus/ui/widgets/drawer.dart';
import 'package:ucampus/core/redux/connectors/settings/type_user.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: DrawerApp(),
      body: Stack(
        children: <Widget>[
          Positioned(
              child: TypeUserConnector()),
        ],
      ),
    );
  }
}
