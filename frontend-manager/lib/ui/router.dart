import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space_screen_args.dart';
import 'package:ucampus_lib/ui/screens/filter_screen.dart';
import 'package:ucampus_lib/ui/screens/home_screen.dart';
import 'package:ucampus_manager/ui/screens/all_reservations_screen.dart';
import 'package:ucampus_manager/ui/screens/edit_availability_confirm_screen.dart';
import 'package:ucampus_manager/ui/screens/edit_availability_screen.dart';
import 'package:ucampus_manager/ui/screens/edit_bookable_screen.dart';
import 'package:ucampus_manager/ui/screens/edit_equipment_screen.dart';
import 'package:ucampus_manager/ui/screens/reservation_info_screen.dart';
import 'package:ucampus_manager/ui/widgets/drawer.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_manager/ui/screens/space_info_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(drawer: DrawerApp(), isUser: false));
      case 'filter':
        return MaterialPageRoute(builder: (_) => FilterScreen());
      case 'all_reservations':
        return MaterialPageRoute(builder: (_) => AllReservationsScreen());
      case 'space_info':
        var space_args = settings.arguments as SpaceScreenArguments;
        return MaterialPageRoute(builder: (_) => SpaceInfoScreen(space: space_args.space));
      case 'edit_equipment':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => EditEquipmentScreen(space: space));
      case 'edit_availability':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => EditAvailabilityScreen(space: space));
      case 'edit_bookable':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => EditBookableScreen(space: space));
      case 'availability_confirm':
        return MaterialPageRoute(builder: (_) => EditAvailabilityConfirmScreen());
      case 'reservation_info':
        var reservation = settings.arguments as Reservation;
        return MaterialPageRoute(
            builder: (_) => ReservationInfoScreen(reservation: reservation));
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
