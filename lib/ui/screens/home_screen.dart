import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/connectors/filter/mini_filter_display.dart';
import 'package:ucampus/core/redux/connectors/home/background_map.dart';
import 'package:ucampus/core/redux/connectors/home/search_bar.dart';
import 'package:ucampus/core/redux/connectors/home/spaces_carousel.dart';
import 'package:ucampus/core/redux/connectors/home/floor_selector.dart';
import 'package:ucampus/ui/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  openTheDrawer(){
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerApp(),
      body: Stack(
        children: <Widget>[
          BackgroundMapConnector(),
          Positioned(
            top: 50,
            right: 15,
            left: 15,
            child: Column(
              children: <Widget>[
                SearchBarConnector(),
                MiniFilterDisplayConnector()
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: FloorSelectorConnector(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SpacesCarouselConnector(),
          ),
        ],
      ),
    );
  }
}
