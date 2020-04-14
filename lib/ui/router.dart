import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/reservation.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/ui/screens/rental_screen.dart';
import 'package:ucampus/ui/screens/reservation_info_screen.dart';
import 'package:ucampus/ui/screens/reservation_screen.dart';
import 'package:ucampus/ui/screens/space_info_screen.dart';
import 'package:ucampus/ui/screens/filter_screen.dart';
import 'package:ucampus/ui/screens/home_screen.dart';
import 'package:ucampus/ui/screens/user_reservations_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'space_info':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => SpaceInfoScreen(space: space));
      case 'reservation':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => ReservationScreen(space: space));
      case 'rental':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => RentalScreen(space: space));
      case 'filter':
        return MaterialPageRoute(builder: (_) => FilterScreen());        
      case 'user_reservations':
        return MaterialPageRoute(builder: (_) => UserReservationsScreen());      
      case 'reservation_info':
        var reservation = settings.arguments as Reservation;
        return MaterialPageRoute(builder: (_) => ReservationInfoScreen(reservation: reservation, canCancel: false)); 
      case 'reservation_info_cancel':
        var reservation = settings.arguments as Reservation;
        return MaterialPageRoute(builder: (_) => ReservationInfoScreen(reservation: reservation, canCancel: true)); 
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
