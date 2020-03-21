import 'package:flutter/material.dart';
import 'package:ucampus/screens/rental_screen.dart';
import 'package:ucampus/screens/reservation_screen.dart';
import 'screens/map_screen.dart';
import 'screens/space_info_screen.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(33, 60, 112, .1),
  100: Color.fromRGBO(33, 60, 112, .2),
  200: Color.fromRGBO(33, 60, 112, .3),
  300: Color.fromRGBO(33, 60, 112, .4),
  400: Color.fromRGBO(33, 60, 112, .5),
  500: Color.fromRGBO(33, 60, 112, .6),
  600: Color.fromRGBO(33, 60, 112, .7),
  700: Color.fromRGBO(33, 60, 112, .8),
  800: Color.fromRGBO(33, 60, 112, .9),
  900: Color.fromRGBO(33, 60, 112, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF213C70, color);

void main() => runApp(UCampus());

class UCampus extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(
            primarySwatch: colorCustom, 
            primaryColor: colorCustom,
            accentColor: Colors.white,
            bottomAppBarColor: colorCustom),
      initialRoute: '/',
      routes: {
        '/': (context) => MapScreen(),
        '/space_info': (context) => SpaceInfoScreen(),
        '/reservation': (context) => ReservationScreen(),
        '/rental': (context) => RentalScreen(),
      },
    );
  }
}
