import 'package:bmi_calculator/pages/bmi_details.dart';
import 'package:bmi_calculator/pages/bmi_page.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: MyColors.colorPrimary,
      ),
      initialRoute: BMICalculator.routeName,
      routes: {
        BMICalculator.routeName: (context) => const BMICalculator(),
        BMIDetails.routeName: (context) => const BMIDetails(),
      },
    );
  }
}
