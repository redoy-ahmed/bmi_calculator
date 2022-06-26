import 'dart:math';

import 'package:bmi_calculator/pages/bmi_details.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/text_style.dart';

class BMICalculator extends StatefulWidget {
  static const String routeName = '/';

  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double weightValue = 40, heightValue = 1.5, result = 0;
  int gender = Gender.Male, tablePosition = 0;
  late String resultText;

  @override
  void initState() {
    calculateBMI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorSecondary,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                genderRow(),
                weightRow(),
                heightRow(),
                resultRow(),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, BMIDetails.routeName,
                    arguments: ScreenArguments(tablePosition, gender));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              child: Text(
                'Details',
                style: textStyleDetailsButton,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding genderRow() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                gender = Gender.Male;
              });
            },
            child: SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width / 2 - 25,
              child: Card(
                color: gender == Gender.Male ? Colors.purple : Colors.grey,
                elevation: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.male,
                        size: 75,
                        color: Colors.white,
                      ),
                      Text(
                        'Male',
                        style: textStyleGender,
                      ),
                    ]),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                gender = Gender.Female;
              });
            },
            child: SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width / 2 - 25,
              child: Card(
                color: gender == Gender.Female ? Colors.purple : Colors.grey,
                elevation: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.female,
                        size: 75,
                        color: Colors.white,
                      ),
                      Text(
                        'Female',
                        style: textStyleGender,
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding weightRow() {
    return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Card(
                color: MyColors.colorWidgetBG,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Weight',
                          style: textStyleHeightTitle,
                        ),
                        RichText(
                          text: TextSpan(
                            text: weightValue.toStringAsFixed(0),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                            children: const [
                              TextSpan(
                                text: '  KG',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                            activeColor: Colors.purple,
                            inactiveColor: Colors.white,
                            value: weightValue,
                            min: 15,
                            max: 150,
                            onChanged: (value) {
                              setState(() {
                                weightValue = value;
                                calculateBMI();
                              });
                            })
                      ]),
                ),
              ),
            ),
          ],
        ));
  }

  Padding heightRow() {
    return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
        ),
        child: Row(
          children: [
            Expanded(
              child: Card(
                color: MyColors.colorWidgetBG,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Height',
                          style: textStyleHeightTitle,
                        ),
                        RichText(
                          text: TextSpan(
                            text: heightValue.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                            children: const [
                              TextSpan(
                                text: '  M',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                            activeColor: Colors.purple,
                            inactiveColor: Colors.white,
                            value: heightValue,
                            min: 1,
                            max: 2.5,
                            onChanged: (value) {
                              setState(() {
                                heightValue = value;
                                calculateBMI();
                              });
                            })
                      ]),
                ),
              ),
            ),
          ],
        ));
  }

  Padding resultRow() {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 230,
              height: 230,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(
                color: MyColors.colorWidgetBG,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      result.toStringAsFixed(2),
                      style: textStyleResult,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      resultText,
                      style: textStyleResult,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void calculateBMI() {
    result = weightValue / pow(heightValue, 2);

    if (result < 16) {
      tablePosition = 1;
      resultText = 'Severe Underweight';
    } else if (result > 16 && result <= 16.9) {
      tablePosition = 2;
      resultText = 'Moderate Underweight';
    } else if (result > 17 && result <= 18.4) {
      tablePosition = 3;
      resultText = 'Mild Underweight';
    } else if (result > 18.5 && result <= 24.9) {
      tablePosition = 4;
      resultText = 'Normal range';
    } else if (result > 25.5 && result <= 29.9) {
      tablePosition = 5;
      resultText = 'Overweight (Pre-obese)';
    } else if (result > 30 && result <= 34.9) {
      tablePosition = 6;
      resultText = 'Obese (Class I)';
    } else if (result > 35 && result <= 39.9) {
      tablePosition = 7;
      resultText = 'Obese (Class II)';
    } else {
      tablePosition = 8;
      resultText = 'Obese (Class III)';
    }
  }
}
