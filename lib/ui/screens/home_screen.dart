import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/connectors/home/background_map.dart';
import 'package:ucampus/core/redux/connectors/home/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundMapConnector(),
          Positioned(
            top: 50,
            right: 15,
            left: 15,
            child: SearchBarConnector(),
          )
        ],
      ),
    );
  }
}
