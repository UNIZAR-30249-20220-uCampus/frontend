import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/ui/screens/filter_screen.dart';
import 'package:ucampus_lib/ui/screens/home_screen.dart';
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
      case 'space_info':
        var space = settings.arguments as Space;
        return MaterialPageRoute(builder: (_) => SpaceInfoScreen(space: space));
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
