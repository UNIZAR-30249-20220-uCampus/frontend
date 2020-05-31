import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 150.0,
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
                      child: Text(
                        "uCampus Manager",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
        ],
      ),
    );
  }
}
