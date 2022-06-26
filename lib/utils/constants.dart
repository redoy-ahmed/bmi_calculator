import 'package:flutter/material.dart';

class Gender {
  static const int Male = 1;
  static const int Female = 2;
}

class MyColors {
  static const MaterialColor colorPrimary = MaterialColor(
    0xFF12153b,
    <int, Color>{
      50: Color(0xFF12153b),
      100: Color(0xFF12153b),
      200: Color(0xFF12153b),
      300: Color(0xFF12153b),
      400: Color(0xFF12153b),
      500: Color(0xFF12153b),
      600: Color(0xFF12153b),
      700: Color(0xFF12153b),
      800: Color(0xFF12153b),
      900: Color(0xFF12153b),
    },
  );

  static const Color colorSecondary = Color(0xFF101434);

  static const Color colorWidgetBG = Color(0xFF272a4e);
}

class ScreenArguments {
  final int tablePosition;
  final int gender;

  ScreenArguments(this.tablePosition, this.gender);
}

class Description {
  static String bmiDescription =
      'Body mass index (BMI) is a value derived from the mass (weight) and height of a person. The BMI is defined as the body mass divided by the square of the body height, and is expressed in units of kg/m2, resulting from mass in kilograms and height in metres. The BMI may be determined using above table or chart which displays BMI as a function of mass and height using contour lines or colours for different BMI categories, and which may use other units of measurement (converted to metric units for the calculation)';
}
