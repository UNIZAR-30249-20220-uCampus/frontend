import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/ui/screens/filter_screen.dart';
import 'package:ucampus/ui/screens/home_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'filter':
        return MaterialPageRoute(builder: (_) => FilterScreen());        
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
