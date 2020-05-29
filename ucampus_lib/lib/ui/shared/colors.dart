import 'package:flutter/material.dart';

class CustomColors {
  static const Map<int, Color> _ucampusBlueSwatch = {
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

  static MaterialColor get uCampusBlue => MaterialColor(0xFF213C70, _ucampusBlueSwatch);

}
