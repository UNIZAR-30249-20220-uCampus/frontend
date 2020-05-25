import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          children: <Widget>[
            Container(
        height: 200.0,
        child: DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Stack(children: <Widget>[
              Positioned(
                  bottom: 20.0,
                  left: 16.0,
                  child: Text("uCampus",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500))),
            ]))),
            ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Home'),
                      )
                    ],
                  )),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
            ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Mis reservas'),
                      )
                    ],
                  )),
              onTap: () {
                Navigator.pushReplacementNamed(context, "user_reservations");
              },
            ),
            ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.settings),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Ajustes'),
                      )
                    ],
                  )),
              onTap: () {
                Navigator.pushReplacementNamed(context, "settings");
              },
            )
          ],
        ),
      );
  }
}