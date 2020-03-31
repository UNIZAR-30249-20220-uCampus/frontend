import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar espacios'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
                  children: <Widget>[ListTile(leading: Icon(Icons.ac_unit))])),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedLoadingButton(
                color: Theme.of(context).primaryColor,
                child: Text('Aplicar filtros',
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
