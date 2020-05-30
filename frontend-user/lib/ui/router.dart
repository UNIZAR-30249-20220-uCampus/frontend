import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/ui/screens/rental_screen.dart';
import 'package:ucampus/ui/screens/reservation_info_screen.dart';
import 'package:ucampus/ui/screens/reservation_screen.dart';
import 'package:ucampus/ui/screens/space_info_screen.dart';
import 'package:ucampus/ui/screens/user_reservations_screen.dart';
import 'package:ucampus/ui/screens/settings.dart';
import 'package:ucampus/ui/widgets/drawer.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/ui/screens/filter_screen.dart';
import 'package:ucampus_lib/ui/screens/home_screen.dart';
import 'package:ucampus/ui/screens/reservation_screen_external.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(drawer: DrawerApp()));
      case 'space_info':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => SpaceInfoScreen(space: space));
      case 'reservation':
        var space = settings.arguments as Space;
        return MaterialPageRoute(
            builder: (_) => ReservationScreen(space: space));
      case 'reservation_external':
        var eservation = settings.arguments as Reservation;
        return MaterialPageRoute(
            builder: (_) => ReservationScreenExternal(reservation: eservation));
      case 'rental':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => RentalScreen(space: space));
      case 'filter':
        return MaterialPageRoute(builder: (_) => FilterScreen());
      case 'user_reservations':
        return MaterialPageRoute(builder: (_) => UserReservationsScreen());
      case 'reservation_info':
        var reservation = settings.arguments as Reservation;
        return MaterialPageRoute(
            builder: (_) => ReservationInfoScreen(
                reservation: reservation));
      case 'settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
