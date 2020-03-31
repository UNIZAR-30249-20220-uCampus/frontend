import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar espacios'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
    );
  }
}
