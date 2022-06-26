import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class BMIDetails extends StatefulWidget {
  static const String routeName = '/details';

  const BMIDetails({Key? key}) : super(key: key);

  @override
  State<BMIDetails> createState() => _BMIDetailsState();
}

class _BMIDetailsState extends State<BMIDetails> {
  late ScreenArguments screenArguments;

  @override
  void didChangeDependencies() {
    screenArguments =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Details'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  color: MyColors.colorWidgetBG,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Gender: ',
                            style: textStyleHeightTitle,
                          ),
                          Text(
                            screenArguments.gender == 1 ? 'Male' : 'Female',
                            style: textStyleHeightTitle,
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Table(
              border: TableBorder.all(color: Colors.purple),
              children: [
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Category',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'BMI (kg/m2)',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 1
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Severe Underweight'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 1
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('< 16.0'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 2
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Moderate Underweight'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 2
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('16.0 – 16.9'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 3
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Mild Underweight'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 3
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('17.0 – 18.4'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 4
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Normal range'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 4
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('18.5 – 24.9'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 5
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Overweight (Pre-obese)'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 5
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('25.0 – 29.9'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 6
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Obese (Class I)'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 6
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('30.0 – 34.9'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 7
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Obese (Class II)'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 7
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('35.0 – 39.9'),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    color: screenArguments.tablePosition == 8
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Obese (Class III)'),
                    ),
                  ),
                  Container(
                    color: screenArguments.tablePosition == 8
                        ? Colors.purple
                        : Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('≥ 40.0'),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  color: MyColors.colorWidgetBG,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            Description.bmiDescription,
                            style: textStyleDescriptionTitle,
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
