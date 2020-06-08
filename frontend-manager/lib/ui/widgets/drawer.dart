import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
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
                    child: Stack(
                      children: <Widget>[
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
                      ],
                    ),
                  ),
                ),
                Container(height: 30),
                ListTile(
                  leading: Icon(
                    Icons.map,
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Inicio',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.today,
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Gestionar reservas',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "all_reservations");
                  },
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.map,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('uCampus v.1.0'),
            subtitle: Text('ucampus.xyz'),
          ),
        ],
      ),
    );
  }
}
